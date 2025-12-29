package com.movie.service.impl;

import com.movie.dao.BaseDao;
import com.movie.entity.ViewingRecord;
import com.movie.service.ViewingRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ViewingRecordServiceImpl implements ViewingRecordService {

    @Autowired
    private BaseDao<ViewingRecord> baseDao;

    @Override
    public void add(ViewingRecord record) {
        baseDao.save(record);
    }

    @Override
    public List<ViewingRecord> findByUser(int userId) {
        return baseDao.find("from ViewingRecord where user.id = ?0 order by startTime desc", userId);
    }

    @Override
    public long getTotalDuration(int userId) {
        List<Long> result = baseDao.findGeneric("select sum(duration) from ViewingRecord where user.id = ?0", userId);
        if (result != null && !result.isEmpty() && result.get(0) != null) {
            return result.get(0);
        }
        return 0;
    }
}
