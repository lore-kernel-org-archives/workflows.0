Return-Path: <SRS0=xBFu=YT=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BDECA9EB9
	for <workflows@archiver.kernel.org>; Sat, 26 Oct 2019 12:00:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F39420863
	for <workflows@archiver.kernel.org>; Sat, 26 Oct 2019 12:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qbXyUec7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbfJZMA6 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 26 Oct 2019 08:00:58 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:44059 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJZMA6 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 26 Oct 2019 08:00:58 -0400
Received: by mail-wr1-f44.google.com with SMTP id z11so5122555wro.11
        for <workflows@vger.kernel.org>; Sat, 26 Oct 2019 05:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
        bh=OYhXBhMfbgGM9IbBfZH5AX9HalxM3RqwhYvsnD5/+3s=;
        b=qbXyUec7aKIQPpzdbgNy1hKsArJ242TZZjTySYlUEDF5tgedJ9o64LeKmwaF0QFRWs
         X9AsEwk4kuoGoKRJlO64l7xGFWKFDw7236UZrdslaXzTdXVIt8VDTrNEtptcSqYItgJu
         60D+6fA/Dc3ppKijLXZhxirHNjcD5cRJAp9KBnAC1APjc+gZgKiuAW0XHmF2ufSI63uY
         nKnngUzkjM7xvIIAHJuP0D7plmhtHvCT/66RUeaANajmf/n5A75IkH5HKnZWDjSTuQg+
         HPWBDPnLvqBiny1QZyY/kWSgIqcaQBZvwJIu/hEbnl0SR0Q0lnmcN6s0Jtl1Eoy7qISJ
         yKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=OYhXBhMfbgGM9IbBfZH5AX9HalxM3RqwhYvsnD5/+3s=;
        b=byTuYjNFjfFKVuW+PQDyk0yVJxcJ+PYNrx3EivDenPFolnNj9jF5qm574Sa9rw4EF9
         MMhssYQxHxDWTS+ShAjREuNwad6R8Phxx2tEejXQP/cVDWPfqsqeXIUwoODGs9KZ1W7r
         uVyqKEDF8kEN1TXEVuNjfSff9CeQofhSsynn8uhOC//hyh/EfC8/TLdRdwkdY7COILQs
         +YLQz3QZIwrl0EtIK9rxG52Z64TOaZxUX7SNVTKD0a7NS+dzC/K4XsZW57+5O5E+ghao
         QGNyhuMeMUTCy1mvtWWyCNCAEKOaRMm9cJFFlJqjM6c9/lL/BCzhmXc5s0pjRVQqhRJt
         ZZyA==
X-Gm-Message-State: APjAAAXuD3r9CuyeL+tdE++w8kg8x9zRL7x71L5uXcWpelevR4Buvd91
        35BJ1NRSysSgN+mwf0eVCEan2NwZ8bZTPg==
X-Google-Smtp-Source: APXvYqyDoO9jSx0ldRu2iv0lv/pqIzaSWKVCqQwaYoCPjE3Krc4t5Kiwxz/pUCgCLi00g2Ql8nrtVg==
X-Received: by 2002:adf:e5cc:: with SMTP id a12mr4543249wrn.258.1572091254931;
        Sat, 26 Oct 2019 05:00:54 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j14sm5631044wrj.35.2019.10.26.05.00.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 Oct 2019 05:00:54 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Subject: Re: Tooling and workflows meeting at OSS EU Lyon
In-Reply-To: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
Date:   Sat, 26 Oct 2019 14:00:52 +0200
Message-ID: <7himobg1hn.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> So, if I read everything correctly, the meeting shall take place at OSS EU
> Lyon, on Tuesday, from 14:00 to 15:00. The following people have 
> expressed interest in attending:
>
> - Steven Rostedt
> - Greg Kroah-Hartman
> - Dmitry Vyukov
> - Konstantin Ryabitsev
> - Christian Brauner
> - Laurent Pinchart
> - Jon Corbet
> - Daniel Vetter
> - Nicolas Belouin
> - Shuah Khan
>
> (If your name is not on this list but you're planning to attend, please 
> follow up.)

I plan to attend with my KernelCI hat on.  The primary goal for me is
listening/observing in order to report back to the other folks doing CI
tooling so we can collaborate on integration points.

Kevin
