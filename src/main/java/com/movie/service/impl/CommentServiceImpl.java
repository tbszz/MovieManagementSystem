package com.movie.service.impl;

import com.movie.dao.BaseDao;
import com.movie.entity.Comment;
import com.movie.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {

    @Autowired
    private BaseDao<Comment> baseDao;

    @Override
    public void add(Comment comment) {
        baseDao.save(comment);
    }

    @Override
    public void delete(int id) {
        Comment comment = baseDao.get(Comment.class, id);
        if (comment != null) {
            baseDao.delete(comment);
        }
    }

    @Override
    public List<Comment> findByMovie(int movieId) {
        return baseDao.find("from Comment where movie.id = ?0 order by createDate desc", movieId);
    }

    @Override
    public void delete(Comment comment) {
        baseDao.delete(comment);
    }

    @Override
    public List<Comment> findAll() {
        return baseDao.findAll(Comment.class);
    }
}
