Return-Path: <SRS0=J16y=YA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1056EC47404
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 23:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC79E20867
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 23:00:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="XJFK/tgb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbfJGXAM (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 19:00:12 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34254 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728980AbfJGXAM (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 7 Oct 2019 19:00:12 -0400
Received: by mail-pf1-f195.google.com with SMTP id b128so9623424pfa.1
        for <workflows@vger.kernel.org>; Mon, 07 Oct 2019 16:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=wRrLB4XYwTKFDUnnVhaVA98UekgbSZopnCf0qfRK5OA=;
        b=XJFK/tgbgtydm8cErxwWWo7cerkfEaJwXaJ2J9yEmuLeY3g6Df3vv0qLWDqb21Em6T
         DbNfaJJSb1oL2o+BAiMWEakVuX9VFFXwDfv3irAUTWrnNhqAwSofyZuD5kbBUmwKdLl1
         EBMD8GLsodnr09I1Kzn47MfUJVySvxZy23G3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=wRrLB4XYwTKFDUnnVhaVA98UekgbSZopnCf0qfRK5OA=;
        b=Zqttj40bWlmdsTlF8H7mh3Z+cuRtyGqxysCR5+pIyQeBlC3ST/vXZGP4eJ9aazUFT4
         AQiT27hhOzMM5RT2f89T6LtkJOJ0/XCipJcJA48D1xpiGKxxeedaN9JMDeuWTumjyfIo
         guD9/HtR4dYEcWoFJw5TZB0p0EUuDS147nIZdZm8nsHVC8hkTU5kHRtTWl8nGixRXlXO
         mdfvF7JAlJe7hsHqACrTSXsfHl7ovhe5j/1CKWQJChj1m7yN540yeITyq8uWAcIgFKmd
         P0lIJEsfAoL6sv2/EfxTc7gpCm59ZmmwpyqnPsU2k96jIUF65/YnbIH8AChqrkY1R7od
         KahQ==
X-Gm-Message-State: APjAAAXAmt+WkP8T63K0/FAzm8ohV3CeDlNik7JeJbeBz5vxV/xi7FRb
        ZsZPSERLh7qRA7orHF3VfFvtsrIAQ64=
X-Google-Smtp-Source: APXvYqzyB9gSG3mKTy62bdmPqPsaWcRTit7EWDJz8K+2uYsqBT+n9bv4it88GNyrOUii/SpY2akyCA==
X-Received: by 2002:a63:f915:: with SMTP id h21mr32978760pgi.269.1570489209553;
        Mon, 07 Oct 2019 16:00:09 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id j24sm15493886pff.71.2019.10.07.16.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 16:00:08 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     David Miller <davem@davemloft.net>, sir@cmpwn.com
Cc:     nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
In-Reply-To: <20191007.173329.2182256975398971437.davem@davemloft.net>
References: <20190924182536.GC6041@hmswarspite.think-freely.org> <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20191007.173329.2182256975398971437.davem@davemloft.net>
Date:   Tue, 08 Oct 2019 10:00:03 +1100
Message-ID: <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

> Personally, I seriously want to change and move on from email, it's
> terrible.

FWIW, I maintain patchwork and I agree with this. Email suffers from a
gap between what can be comprehended by humans and what can be reliably
comprehened by machines.

For example:

 - is a given series a revision of a previous series? Humans can change
   the name of the cover letter, they can re-order or drop patches,
   split and merge series, even change sender, and other humans just
   figure it out. But if I try to crystalise that logic into patchwork,
   things get very tricky. This makes it hard to build powerful APIs
   into patchwork, which makes it harder to build really cool tools on
   top of patchwork.

 - what are the dependencies of a patch series? Does it need another
   series first? Does it apply to a particular tree? (maintainer/next,
   maintainer/fixes, stable?) This affects every CI system that I'm
   aware of (some of which build on patchwork). Humans can understand
   this pretty easily, computers not so much.

Non-email systems have an easier time of this: with gerrit (which I'm
not a big fan of, but just take it as an example) you push things up to
a git repository, and it requires a change-id. So you can track the base
tree, dependencies, and patch revisions easily, because you build on a
richer, more structured data source.

Kind regards,
Daniel

> I just want tools and pretty web pages, in fact I'll use just about
> anything in order to move on from email based workflows entirely.

