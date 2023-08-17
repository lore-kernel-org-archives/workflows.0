Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC1FC2FC39
	for <workflows@archiver.kernel.org>; Thu, 17 Aug 2023 14:17:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346880AbjHQORF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Aug 2023 10:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351679AbjHQOQl (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Aug 2023 10:16:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBD619A1
        for <workflows@vger.kernel.org>; Thu, 17 Aug 2023 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692281760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=EepWZUlLZufYOGHJ9jYLEEL/h4ezsLPiT+Hfuv0cMjQ=;
        b=S8OCruyWqmPeMR+xFbwW5mOG3bfVP7B2jMXRFFgtbJiV7M3tpgyI2tZggZy6UbnfUngLos
        ZlysUd+qPfvJhRj1E1zmUZ9/a5wIuHHDoiAXjJnXuZmpuzjIcip/USa1uuC7/u0E8Y+Dpc
        TZOQ+JBhG2TSm18XULUp+HENdJGeIr8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-dI2bAG-SPj-WNgIO5Bt0tQ-1; Thu, 17 Aug 2023 10:15:58 -0400
X-MC-Unique: dI2bAG-SPj-WNgIO5Bt0tQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-997c891a88dso491824966b.3
        for <workflows@vger.kernel.org>; Thu, 17 Aug 2023 07:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281757; x=1692886557;
        h=mime-version:message-id:date:subject:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EepWZUlLZufYOGHJ9jYLEEL/h4ezsLPiT+Hfuv0cMjQ=;
        b=ZhPoMNAls1IxpJaGVmU9qTW139EDFZ9kC1WEuylEFH2r0gaIq8kkzwaEtXv1JSWciV
         H3q/qm0SxKtFaLzDIzRD9kdUNMWs2vzPBCq260fVpkJBCq7YRRsxKt2pFntvUP/WxAGq
         KIyeinW7ccC/eNyxS3fDx8nkPI1s8+NnvG8HpetbS5Oc1KnCF3d7jMMyl1YWPCmH0sr0
         TRugksr3wuY9WOncJ9LRQUZxaDSEHC1XVIGXYnHNmuA/Q4PDYy9pLm2umd3yZPeYQxIO
         YMLOdifXjB6zZsbsJ3INwHMGVV8eMLDONHy3V/J8jaPrPCsWG6qW0Bhl5D4/bPUVqmpu
         V6Hw==
X-Gm-Message-State: AOJu0YwPqVS1qHrSN+OOQql4J6ZOHqLSTGDAfzMwuyaR6P6ovWLxUH+r
        Du3uGJG2Zpbjd74/Hq6RYRQwuUyDONAzsDGmCFbEJZ5l6Ih4LFn9Ud3kzrdqPPi99ogv+OY6yqK
        TpApJFSrHqzT6zEqeJUpgZPdDKgPgEIYzIBdif+x6Aevz+cbVpd6jpCpu7KN50OEQJd0llnZc+o
        I=
X-Received: by 2002:a17:906:4999:b0:999:26d3:b815 with SMTP id p25-20020a170906499900b0099926d3b815mr5099712eju.64.1692281757221;
        Thu, 17 Aug 2023 07:15:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKLQ5lZ+SsFG5FTPIf98iMwPmEojt8nOI/JFQjH4+wuPJEAg3TdxemsIXWAWoBDEzyTuFWSg==
X-Received: by 2002:a17:906:4999:b0:999:26d3:b815 with SMTP id p25-20020a170906499900b0099926d3b815mr5099693eju.64.1692281756646;
        Thu, 17 Aug 2023 07:15:56 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id b15-20020a170906490f00b0099c971ba285sm10143889ejq.5.2023.08.17.07.15.55
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:15:55 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id EC84CD3C2DB; Thu, 17 Aug 2023 16:15:54 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     workflows@vger.kernel.org
Subject: Selective lei filters and replies to old threads
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 17 Aug 2023 16:15:54 +0200
Message-ID: <87ttsxbvqd.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi everyone

I've been happily using lei in place of mailing list subscriptions for a
while now, but ran into an issue recently while trying to limit the
volume of email, which I am hoping someone has a good solution for:

Basically, what I was trying to do was to avoid following the firehose
of patches that is netdev@vger, and instead selectively pull in patches
for the areas I care about (which mostly boils down to avoiding all the
driver-only patches). To achieve this, I've set up a lei search using
the handy dfn: prefix for searches. In simplified form I've gone from a
search like:

q = l:netdev.vger.kernel.org AND rt:1.month.ago..

to

q = dfn:net/core/* AND rt:1.month.ago...

(my full query has a few more terms but this is enough to illustrate the
problem).

Now, the above query works beautifully to bring down the volume of
patches to a more manageable level (phew), but I have run into a problem
with follow-ups, which I'll try to describe as I understand it:

I'm using the --threads parameter to 'lei q' which nicely pulls down the
whole thread whenever one patch in the series matches[0]. However, if a
reply shows up later, which does not in itself match the dfn: query, but
is part of a thread that does, this reply will only be downloaded if the
original thread still matches[1]. Which it doesn't necessarily do
anymore because of the time limit parameter added by lei which only
pulls in new emails since the last one downloaded.

I can get around the default lei time limit by adding
--remote-fudge-time=1.month to 'lei up', but that makes lei pull in
thousands of mails on every update, which seems a bit wasteful. And I'll
still miss replies to threads that are older than the 1-month time
limit.

So really I think what I'm looking for is a way to construct a query
that uses the send time of the individual (reply) messages, but applies
the dfn: match to the whole thread. Is there a way to do that? And/or
does anyone have any other neat tricks they are using to construct a
similar selective mail feed without missing stuff? :)

-Toke



[0] Side note: if anyone has a nice trick to specifically exclude Greg's
stable patch bombs from this, I would be interested in hearing about
that as well :)

[1] An example: I was missing this reply in my local mailbox even though
the original thread was there:
https://lore.kernel.org/all/64dcf5834c4c8_23f1f8294fa@willemb.c.googlers.com.notmuch/
Adding the --remote-fudge-time parameter pulled it in.

