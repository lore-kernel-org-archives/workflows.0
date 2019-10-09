Return-Path: <SRS0=9qbL=YC=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4120C4360C
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 02:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C309620859
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 02:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="i+RK0IxG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbfJICCe (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Oct 2019 22:02:34 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41155 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfJICCe (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 8 Oct 2019 22:02:34 -0400
Received: by mail-pf1-f193.google.com with SMTP id q7so542417pfh.8
        for <workflows@vger.kernel.org>; Tue, 08 Oct 2019 19:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=BNccobBm1CEVAedwKT3XoFy6mk7tzeMROBEQplgiEtA=;
        b=i+RK0IxGclmXIklrR6vvjkiW5kHUSFiDDF/4N1HOAu9aBH3L7+LVSvESwvcmZBRT1d
         RWVSrhbD557oDExaC1ZSapw7+kps9k47T7se9a6Mvc2Wln8SgW3yp5axqC7CjOXl6R9k
         p5lE7PMJ7xb8pPyVq2MpFDr2Y/oo96UtWKx08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=BNccobBm1CEVAedwKT3XoFy6mk7tzeMROBEQplgiEtA=;
        b=Khai9U6bLMIXmMtZ76pLxaPXF6A84bhuk58LXG84BlxyKGOOlDq4k5w3Fl+SUAf+SN
         7GAMH3tzaAp0OvII+4KJS641sgJpBiIyuMWMal+THtAHlKTML7J3YJdYnlzQELXnlJhq
         qunfX6DDzKGmC1DdzWBfsZ5bwb+cwYSr5TSkx8QCZ6FaXnCRsD6d1W45KTQ83oT+n3i/
         pst0z01rXQcWFBuGNCXnzSQL1AUG0TS6+7l81LzES4XsZxzLajPtcj8ugNVqmq+bJ7tO
         tBgFZTssIjVG/7BNuFbWIyTr7AamYAdBEQRHCnFrtA9CkootZ+O9Fk+rnKrtZDaYClSE
         80fA==
X-Gm-Message-State: APjAAAXD8bT5ZwCljP5FIzQg49NyQMcIrgmm7mlm1r098ZLhFKgNdaPw
        TpZaWAUWKEAP4mMjdoMw1sMqGg==
X-Google-Smtp-Source: APXvYqyZYQLT8NHdLs7WEO7YTfaanzHsCpyYSpyIut37NorCOYoUI8rpinlg+Keu7wNu2kTJ7n9eYQ==
X-Received: by 2002:a63:5b46:: with SMTP id l6mr1638941pgm.359.1570586553522;
        Tue, 08 Oct 2019 19:02:33 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id t21sm444249pgi.87.2019.10.08.19.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 19:02:32 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
In-Reply-To: <20191008164309.mddbouqmbqipx2sx@redhat.com>
References: <20190924182536.GC6041@hmswarspite.think-freely.org> <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20191007.173329.2182256975398971437.davem@davemloft.net> <87zhicqhzg.fsf@dja-thinkpad.axtens.net> <20191007211704.6b555bb1@oasis.local.home> <20191008164309.mddbouqmbqipx2sx@redhat.com>
Date:   Wed, 09 Oct 2019 13:02:28 +1100
Message-ID: <87imoyr80b.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Don Zickus <dzickus@redhat.com> writes:

> On Mon, Oct 07, 2019 at 09:17:04PM -0400, Steven Rostedt wrote:
>> On Tue, 08 Oct 2019 10:00:03 +1100
>> Daniel Axtens <dja@axtens.net> wrote:
>> 
>> > Non-email systems have an easier time of this: with gerrit (which I'm
>> > not a big fan of, but just take it as an example) you push things up to
>> > a git repository, and it requires a change-id. So you can track the base
>> > tree, dependencies, and patch revisions easily, because you build on a
>> > richer, more structured data source.
>> 
>> I believe we all want a new system that can handle this, but still be
>> able to work with email. Patchwork requires to read all emails and
>> figure out what to do with it. This workflow doesn't need to do that.
>> But it should be able to send out emails on comments, and a reply to
>> one of those should easily be put back into the system.
>> 
>> As for adding patches, we can push to a git tree or something that the
>> tool could read. It's much easier to know what to do with a branch then
>> email. A rebase could be a new version of the series (and we should
>> probably archive the original version).
>
> Thanks for the thoughts.  Your thoughts here and your bugzilla example make
> sense and ties into some of the work we are experimenting with, with a small
> group at Red Hat.  My only sticky point is the initial patch submission.
> Pushing to a forge like github, gerrit, or gitlab makes a ton of sense like
> you said above.  But what do we do with folks who still email patches
> initially (instead of the git-push)?
>
> What should be the expectations there?  Leverage patchwork to create a 'git
> push'?  Reject the patchset?  Something else?  Curious.

Normally I would say "the patchwork API makes this really easy" but I
got sick of saying it, so I thought I'd just demonstrate instead.

It takes less than 100 lines of python.

https://github.com/daxtens/forge-bridge

Currently running against the powerpc list and pushing all new series to
my github: https://github.com/daxtens/linux/branches

The really tricky bit is the comment bridge - syncing comments between
the forge and the ML is legitimately tricky.

For the reasons Konstantin identifies, I'm not sure that this is the
path we want to go down, but I think there's a lot of value in keeping
these discussions practical, at least in part.

>
> Thanks!
>
> Cheers,
> Don
