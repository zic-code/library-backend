const express = require("express");
const router = new express.Router();
const db = require("../db"); // pg client
const { ensureLoggedIn } = require("../middleware/auth"); // 로그인 체크용 미들웨어

/** GET /reviews/:book_id
 * 특정 책에 대한 모든 리뷰 조회
 */
router.get("/:book_id", async (req, res, next) => {
  try {
    const { book_id } = req.params;

    const result = await db.query(
      `SELECT r.id, r.user_id, u.username, r.rating, r.comment, r.created_at
       FROM reviews AS r
       JOIN users AS u ON r.user_id = u.id
       WHERE r.book_id = $1
       ORDER BY r.created_at DESC`,
      [book_id]
    );

    return res.json({ reviews: result.rows });
  } catch (err) {
    return next(err);
  }
});

/** POST /reviews/:book_id
 * 로그인한 사용자가 책에 대한 리뷰 작성 (중복은 방지됨)
 * 요청 body: { rating, comment }
 */
router.post("/:book_id", ensureLoggedIn, async (req, res, next) => {
  try {
    const { book_id } = req.params;
    const { rating, comment } = req.body;
    const user_id = res.locals.user.id;

    const result = await db.query(
      `INSERT INTO reviews (user_id, book_id, rating, comment)
       VALUES ($1, $2, $3, $4)
       RETURNING id, user_id, book_id, rating, comment, created_at`,
      [user_id, book_id, rating, comment]
    );

    return res.status(201).json({ review: result.rows[0] });
  } catch (err) {
    // 중복 리뷰 (unique constraint)에 의한 에러 처리
    if (err.code === "23505") {
      return res.status(400).json({ error: "You have already reviewed this book." });
    }
    return next(err);
  }
});

router.patch("/:book_id", ensureLoggedIn, async function (req, res, next) {
  try {
    const userId = res.locals.user.id;
    const { book_id } = req.params;
    const { rating, comment } = req.body;

    const result = await db.query(
      `UPDATE reviews
    SET rating =$1,
        comment = $2
    WHERE user_id =$3 AND book_id=$4
    RETURNING book_id, rating, comment`, [rating, comment, userId, book_id]
    )
    if (result.rows.length === 0) {
      return res.status(404).json({ error: "Review not found for this book" })
    }
    return res.json({ review: result.rows[0] });
  } catch (err) {
    console.error("Patch Error for reviews", err)
    return next(err);
  }


})

module.exports = router;