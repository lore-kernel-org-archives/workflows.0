Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F183EC433F5
	for <workflows@archiver.kernel.org>; Tue,  4 Oct 2022 18:13:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiJDSN5 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 4 Oct 2022 14:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiJDSNz (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 4 Oct 2022 14:13:55 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC8767C84
        for <workflows@vger.kernel.org>; Tue,  4 Oct 2022 11:13:54 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id a11so941954qto.10
        for <workflows@vger.kernel.org>; Tue, 04 Oct 2022 11:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=fO/JpHdHbnnGpQX04F/Oau78NLCRz1vfsBMEmZ0J96s=;
        b=BW6Bo4ze8wD19cbDxt8TiUs9VLD1QqH9rpg3o/xgk1nPXJNcmTYJ64Rd6cDFQywsTL
         9tGXIi++p5a+JHI0WzU183a9PAyucjUtwyfM2w6CJuW3Ek28NYppARmlAE5D3+6SdDhp
         TNuq+7V6DGg/ZMrezLHgoUCs9CGAMXQ1iy/Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=fO/JpHdHbnnGpQX04F/Oau78NLCRz1vfsBMEmZ0J96s=;
        b=IZkBll9d494ArQMygUf3V+CrwUAIAT3yc0knsoh+mZZpNbnHoPxVQsVusQqNnbb8rD
         FPWesxMVKd/xhR1NCzwJOLz8e6NaOzbnr9GSLwA91QrTsJQXlpePjcqupmBNzmkhCaVP
         ZHZKyL9Utbt6cbsL/T8n8m8ldb7/EX1YkrBjB+CsHqDJ+FNZBXulNS+MxIq5Fwy6hy1g
         srF2Rw55lLzk4CJ9Ym+F3IIf3lR4tjIE8YL5+4oRtxlcfg6Ae5jponKMpko1VYIGfPRW
         xN8T1k3p3m/5ngLO12s9xwZDgL2BgNnDvkebiypyvK/b5Mq4opMr4G5d2MR0Gs4bkDXn
         N3eg==
X-Gm-Message-State: ACrzQf2sqAf6Jv8nn8u1Ne+2QiHqfhzal2PF4+kWektp5vqMlsPA4H25
        NleJGm7oAHA3rcsgJaRl72kdvQ==
X-Google-Smtp-Source: AMsMyM5JEAqaJhIKfRWcIEj6aYLtImfVjjElMtuKTwbwOWUWhsy7eLLseBrc+agUN30m1MLSUppbdQ==
X-Received: by 2002:a05:622a:1146:b0:35b:afe8:5c9c with SMTP id f6-20020a05622a114600b0035bafe85c9cmr20301900qty.54.1664907233859;
        Tue, 04 Oct 2022 11:13:53 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id x188-20020a3795c5000000b006bad7a2964fsm14192403qkd.78.2022.10.04.11.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 11:13:53 -0700 (PDT)
Date:   Tue, 4 Oct 2022 14:13:51 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Thorsten Leemhuis <linux@leemhuis.info>,
        "Artem S. Tashkinov" <aros@gmx.com>,
        ksummit <ksummit@lists.linux.dev>, workflows@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221004181351.qyvu42ytkka3ep3m@meerkat.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
 <Yzx1T05Ut0of55KY@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yzx1T05Ut0of55KY@kroah.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 04, 2022 at 08:02:55PM +0200, Greg KH wrote:
> On Tue, Oct 04, 2022 at 01:53:54PM -0400, Konstantin Ryabitsev wrote:
> > As I have stated multiple times, the hard part will be keeping a team of
> > people who are willing to do the bug triage work, but maybe we can start with
> > Greg KH using his intern funds to hire someone (assuming he's not already
> > using these funds for someone to help him with all the other tasks).
> 
> I have no interns anymore, and the ones that the LF does have in the
> kernel program are using all of the remaining budget that we have, so
> much so that we have a whole bunch of unpaid ones at the same time as we
> have so many people applying for the process.
> 
> So I don't think you can use those funds, they are all spoken for,
> sorry.


Yeah, I wasn't actually serious about the interns. An effort like this needs
to have a separate fund allocation that can't be cannibalized for any other
purpose.

-K
[Fixing the ksummit address]
