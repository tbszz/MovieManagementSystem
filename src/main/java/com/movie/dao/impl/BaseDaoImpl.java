package com.movie.dao.impl;

import com.movie.dao.BaseDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository("baseDao")
public class BaseDaoImpl<T> implements BaseDao<T> {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(T t) {
        getCurrentSession().save(t);
    }

    @Override
    public void delete(T t) {
        getCurrentSession().delete(t);
    }

    @Override
    public void update(T t) {
        getCurrentSession().update(t);
    }

    @Override
    public T get(Class<T> entityClass, Serializable id) {
        return getCurrentSession().get(entityClass, id);
    }

    @Override
    public List<T> findAll(Class<T> entityClass) {
        return find("from " + entityClass.getName());
    }

    @Override
    public List<T> find(String hql, Object... params) {
        Query<T> query = getCurrentSession().createQuery(hql);
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                query.setParameter(i, params[i]);
            }
        }
        return query.list();
    }

    @Override
    public <E> List<E> findGeneric(String hql, Object... params) {
        Query<E> query = getCurrentSession().createQuery(hql);
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                query.setParameter(i, params[i]);
            }
        }
        return query.list();
    }
}
