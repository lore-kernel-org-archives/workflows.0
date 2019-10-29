Return-Path: <SRS0=oU80=YW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72348CA9EAE
	for <workflows@archiver.kernel.org>; Tue, 29 Oct 2019 22:35:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3293A2087E
	for <workflows@archiver.kernel.org>; Tue, 29 Oct 2019 22:35:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="nJsFexxS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfJ2WfP (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 29 Oct 2019 18:35:15 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:33546 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfJ2WfP (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 29 Oct 2019 18:35:15 -0400
Received: by mail-pl1-f179.google.com with SMTP id y8so21002plk.0
        for <workflows@vger.kernel.org>; Tue, 29 Oct 2019 15:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
        bh=dV4H3/lvrOl6QoOMbFrwisiApiVm5tDekla9qexdP9Y=;
        b=nJsFexxSrDVnKiHq42WsOGf5AZxndfdY9AjnoGdtceznjjPY/DZtkwVvuZEq9CLGWJ
         Rk6OhisEdSZXN8HN9UhSnZxBhXBs1fvWhviUH0fkgHkb6+685K7M85AoYMGdrlZuO9jE
         qTVbviqwi2e/xRDr+hePmmYCw95E04457abRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=dV4H3/lvrOl6QoOMbFrwisiApiVm5tDekla9qexdP9Y=;
        b=Fn7E+PmeBSttKr75LpQUN5Lq2lTiFQ2HOUGezO4ZFgIwB+j/diIrr1cBf+QM4/Gn3m
         OTT7DtgjAh/tLPnAdiSivYRLHCpLNgUARGcyJdJ7tDpmrzbEgTmA3mSG4ZJiELSyJeue
         gkh9UV+9TlFx4t3o/xNIrN26Qt/5nQNLN30vVp1JPoDZ2ZigkUusOtB6TEof2MegkDu2
         fe4mX6XWtgpaDrZMASXm6a3D/Si608hWdZ+GAJ/YlGzQJbfF6km3vagTQFxYFhqqXOSp
         zZTszkZPr5rLs5B4fbULZVnnpEDO+Z5ki9AQ4zngEnTPbYQuBxQq7vo5Yv8tkuNg+ii8
         jK4A==
X-Gm-Message-State: APjAAAXwE+JblWdffPgwN5FjCJh7KJjOrB0c7pHbt6aGmbJXc3RRzWYF
        4kdt1d3F2FrJr5kq26SYnP259oPhaAY=
X-Google-Smtp-Source: APXvYqxUd9W9YcbLKmgrnMnY9T6R7+BbvZ0NHCO8PCRB63L4y66pWHBPT5TQRIZJffIeGxR19tfzEA==
X-Received: by 2002:a17:902:bb8d:: with SMTP id m13mr1133305pls.29.1572388512754;
        Tue, 29 Oct 2019 15:35:12 -0700 (PDT)
Received: from localhost (2001-44b8-1113-6700-783a-2bb9-f7cb-7c3c.static.ipv6.internode.on.net. [2001:44b8:1113:6700:783a:2bb9:f7cb:7c3c])
        by smtp.gmail.com with ESMTPSA id s202sm145801pfs.24.2019.10.29.15.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 15:35:11 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Han-Wen Nienhuys <hanwen@google.com>, workflows@vger.kernel.org
Subject: Re: Lyon meeting notes
In-Reply-To: <CAFQ2z_PiNzDeBT7mnprRdk2kf==HoBU1HM7NT4hgFns1wt4WVg@mail.gmail.com>
References: <CAFQ2z_PiNzDeBT7mnprRdk2kf==HoBU1HM7NT4hgFns1wt4WVg@mail.gmail.com>
Date:   Wed, 30 Oct 2019 09:35:08 +1100
Message-ID: <87wocnmb8j.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi all,

> I tried to take some notes at the session today. They're a bit rough,
> but I hope they'll be useful to someone.
>
> https://docs.google.com/document/d/1khLOBw5-HyaaNX7xregpHQLSfvGDUeHDY921bkI-_os/edit?usp=sharing

I can't quite make sense of the notes for Patchwork, but if you have
specific asks for us, we can try to target them for Patchwork 3.0, which
I expect will come out some time next year. (Modulo most of us doing
this as a hobby, of course.)

> KR: write local command to work with patchwork.
We have a couple of local commands already, pwclient and git-pw. Is
there something new that would be helpful?

As an aside, I know offline stuff has come up a few times, and I think
it should be reasonably straightforward to make a caching API client
that can buffer your requests until you're next online. I don't have any
cycles to do this, but I'm happy to help anyone who does.

Regards,
Daniel
