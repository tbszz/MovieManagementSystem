package com.movie.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T> {
    void save(T t);

    void delete(T t);

    void update(T t);

    T get(Class<T> entityClass, Serializable id);

    List<T> findAll(Class<T> entityClass);

    List<T> find(String hql, Object... params);

    <E> List<E> findGeneric(String hql, Object... params);
}
