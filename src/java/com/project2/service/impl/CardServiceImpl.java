package com.project2.service.impl;

import com.project2.dao.CardDao;
import com.project2.entity.Card;
import com.project2.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/10/18 0018.
 */
@Service
public class CardServiceImpl implements CardService{
    @Autowired
    private CardDao cardDao;

    @Override
    public void insertCard(Card card) {
        cardDao.insertCard(card);
    }

    @Override
    public void updateCard(Card card) {
        cardDao.updateCard(card);
    }

    @Override
    public Card queryCardById(Integer id) {
        return cardDao.queryCardById(id);
    }

    @Override
    public List<Card> queryCardByRId(Integer rId) {
        return cardDao.queryCardByRId(rId);
    }
}