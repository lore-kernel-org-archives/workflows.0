Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E1CC433F5
	for <workflows@archiver.kernel.org>; Tue,  4 Oct 2022 18:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiJDSEL (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 4 Oct 2022 14:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiJDSEK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 4 Oct 2022 14:04:10 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B378476E1
        for <workflows@vger.kernel.org>; Tue,  4 Oct 2022 11:04:09 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-131fd187e35so13629825fac.7
        for <workflows@vger.kernel.org>; Tue, 04 Oct 2022 11:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sor9D9i/EJpgjGPLpMubXbPXNL6NfcDkrHXBrZqrku4=;
        b=etS61wv0tV5Tr5yGB26lMRJz5KF87CbWf8vsC0mcngDXaqkhSZKuaPi8OghfGOQLQj
         aP98reDcR1aPBsiupOp8u3oTidiuNovXySlB1hshVQjrHYVtiJmk1WYMVamRA54IQTb6
         359w1y6S03b8fDqbMY6dbwRQ8Nj6JfRjoQhMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sor9D9i/EJpgjGPLpMubXbPXNL6NfcDkrHXBrZqrku4=;
        b=v/4FbIHxNjwStZKNn0deUKfiyH1NSHMof+Mm5roUVC7Zp/BrAhb1QAmW0+LICwwOY+
         UcPQeMPmsCUOkMPxMhm60cl5YWhovMpDDinfS0O4MYrbP0TNEH7woUIyjeSS7+YtHPH6
         46vWhJUYU752ugJYWTMOE+Y1X6eRKU1UdKTAu5FfrIUOck5D6o5eBYobf6nAGag8cLqe
         H9icttMM+1IlGp1ulPZF5s8Dzr7uNCDXELVRr4P6AzsA3hiEeMqNRZ2hp29omjahnots
         HK5wi7nQQjRSGichqjB/iay8iUI6Bwr3+IQjcqhUAwxHMrxnNNdZgsV1WP4xQ6qq+A+O
         lCOQ==
X-Gm-Message-State: ACrzQf08m2wCL1zZrLQCf2YWrmn48y8uih1sUgT4SlfVOI1zih1SR05e
        Kumc9NEhTPt52r1m5i1G6GXO3wEMXaGnkA==
X-Google-Smtp-Source: AMsMyM4lt2mNIPHxeAd4mNfcS/el8Il8LBUv5BIDdi/+01VP71wxRpFCJTE0OatYs2t19rfYhQXIHw==
X-Received: by 2002:a05:6870:7094:b0:131:5b48:7f0b with SMTP id v20-20020a056870709400b001315b487f0bmr517924oae.283.1664906648291;
        Tue, 04 Oct 2022 11:04:08 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id v4-20020a4a9744000000b00448a3ecdc9dsm2690415ooi.22.2022.10.04.11.04.05
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 11:04:05 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id v134so764257oie.10
        for <workflows@vger.kernel.org>; Tue, 04 Oct 2022 11:04:05 -0700 (PDT)
X-Received: by 2002:aca:b957:0:b0:351:4ecf:477d with SMTP id
 j84-20020acab957000000b003514ecf477dmr469103oif.126.1664906645054; Tue, 04
 Oct 2022 11:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info> <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
In-Reply-To: <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 4 Oct 2022 11:03:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7HyGxs2Ad-UiF-3qeLJnPc_WGKOVqYqaTjrbRig0V9Q@mail.gmail.com>
Message-ID: <CAHk-=wi7HyGxs2Ad-UiF-3qeLJnPc_WGKOVqYqaTjrbRig0V9Q@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Thorsten Leemhuis <linux@leemhuis.info>,
        "Artem S. Tashkinov" <aros@gmx.com>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 4, 2022 at 10:53 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> 2. Create and maintain a mapping from MAINTAINER subsystem entries to
>    Product/Component categories in Bugzilla (the scheme to be established).

It's probably worth asking the 0day people what they do.

Maybe they do it all manually and have no real helping infrastructure,
but I see emails from them that often (but certainly not always) seem
to get the right people involved.

And while the MAINTAINER file is useful for a fiel mapping, I'm not
convinced it's all that useful for the "product/component category"
mapping, because I doubt people will actually fill that in well (and
reliably) enough.

With actual bisection data, it's fairly easy (get the emails from the
commit that got bisected). But things like "use the backtrace in the
oops to figure out who to add to participants" is likely a bit more of
a "use clever heuristics" kind of thing.

Anyway, I do think that some kind of automation would be really good,
at least for reports that have bisection information or backtraces in
them. Without automation, people _will_ be overwhelmed on the first
level response to bug reports (ie the "try to figure out who to bring
in" front).

But if the automation is too stupid, people will start ignoring the
report emails just on the assumption that it got thihngs wrong.

Of course, if the automation is really solid enough, I think it should
work on lore.kernel.org, not on just a bugzilla thing.

             Linus
