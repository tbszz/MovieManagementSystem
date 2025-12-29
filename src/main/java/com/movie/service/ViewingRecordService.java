package com.movie.service;

import com.movie.entity.ViewingRecord;
import java.util.List;

public interface ViewingRecordService {
    void add(ViewingRecord record);

    List<ViewingRecord> findByUser(int userId);

    long getTotalDuration(int userId);
}
