Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED43FC433E1
	for <workflows@archiver.kernel.org>; Mon, 22 Mar 2021 18:33:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCF946199F
	for <workflows@archiver.kernel.org>; Mon, 22 Mar 2021 18:33:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhCVSdR (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 22 Mar 2021 14:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbhCVScx (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 22 Mar 2021 14:32:53 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF16C061756
        for <workflows@vger.kernel.org>; Mon, 22 Mar 2021 11:32:52 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id f16so22387918ljm.1
        for <workflows@vger.kernel.org>; Mon, 22 Mar 2021 11:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eze6fo/qU2elQxuT7PNT60Pcmqt6hp4FChAafrK7TlY=;
        b=MxVOxL3Na62SXddwG0JngoJ0NSLgIP7LZhILCSHq0+vh3G87bf4ovXeVud9pSOr+gD
         mBBpRsaDF/G+IuEsR3hmtNXFYGch9vLD+iOXqyJfevKWC+m4Heg8NC353wM0YauFP1sc
         EwIEyfAPoYFmfum4Gdj/bVbPeK/XiG0jOnTLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eze6fo/qU2elQxuT7PNT60Pcmqt6hp4FChAafrK7TlY=;
        b=I/n4pRHRxPPiiAn8s9ucABq9Aqxk7b6MhbZcEXWOAhEjOYk9pWp7Uyj51hDBALI0v/
         IcLDBGRgPW+JvVifdT1JD2/1HWT0oAU/LTx12MCkfZe6N1D9k37fx2g6C+j4tgBH0aM5
         BqnXxRBsPEW6JpKyzH7MWUJyBk9Ezine6J+nsq0SestsEhLngyvLWWFpfaP7pK2Df38J
         YaMKHe9S3GbnMeZqqpNDRDwZBueTmIqawBuRq4dO0WVqT5EHzHikJ4K7gBN90E1dKlBM
         sBD+sik3/BYuNuopEdY/q1h0b6oKW18BdftHt8rbgbdDEsfVOmc/mZ8pi7ueRsCo4k/Z
         exww==
X-Gm-Message-State: AOAM532T+OT9OasJpi98j7uxNZy3Yzlcag39OCuKA3WG6nwoEWuaj+nZ
        dNRAYwNq1YvXpAww78AJMv70VWirmxUWnQ==
X-Google-Smtp-Source: ABdhPJzsULO+kReVW5oqTTELbYT3Qnze/D0o6HYbG2x641AUqtqhF1eb03wjEZmpd7ZM7B+xAFpd2g==
X-Received: by 2002:a2e:908a:: with SMTP id l10mr563188ljg.38.1616437970839;
        Mon, 22 Mar 2021 11:32:50 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id x13sm2020041ljj.4.2021.03.22.11.32.50
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 11:32:50 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id s17so22343594ljc.5
        for <workflows@vger.kernel.org>; Mon, 22 Mar 2021 11:32:50 -0700 (PDT)
X-Received: by 2002:a2e:864d:: with SMTP id i13mr530535ljj.48.1616437969891;
 Mon, 22 Mar 2021 11:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <613fe50d-fc9c-6282-f1f3-34653acb2ee9@leemhuis.info>
In-Reply-To: <613fe50d-fc9c-6282-f1f3-34653acb2ee9@leemhuis.info>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 22 Mar 2021 11:32:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgiYqqLzsb9-UpfH+=ktk7ra-2fOsdc_ZJ7WF47wS73CA@mail.gmail.com>
Message-ID: <CAHk-=wgiYqqLzsb9-UpfH+=ktk7ra-2fOsdc_ZJ7WF47wS73CA@mail.gmail.com>
Subject: Re: RFC: create mailing list "linux-issues" focussed on issues/bugs
 and regressions
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        workflows@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Mar 22, 2021 at 8:18 AM Thorsten Leemhuis <linux@leemhuis.info> wrote:
>
>     I even requested a
> "linux-regressions@vger.kernel.org" a while later, but didn't hear
> anything back; and, sadly, about the same time I started having trouble
> finding spare time for working on regression tracking. :-/

Honestly, I'd much prefer the name 'linux-regressions' as being much
more targeted than 'linux-issues'. Make it clear that the list is only
for regressions that people can describe some way, rather than some
general "I have issues with xyz".

The more clear-cut the list is, the better, I think.

            Linus
