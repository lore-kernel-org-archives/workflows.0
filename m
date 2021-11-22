Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8F7C433EF
	for <workflows@archiver.kernel.org>; Mon, 22 Nov 2021 15:07:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhKVPKm (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 22 Nov 2021 10:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239476AbhKVPKl (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 22 Nov 2021 10:10:41 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF57C061574
        for <workflows@vger.kernel.org>; Mon, 22 Nov 2021 07:07:35 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id p4so18418708qkm.7
        for <workflows@vger.kernel.org>; Mon, 22 Nov 2021 07:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=frW6SwGVKr+gYsdpZtEXAzu0SF2qdOu8fdHNMktMUqQ=;
        b=fHYGJT4ttdZQ/f/Nv/b4NpdndW4jSPVX31dOJhmYCmemQlZmbDFVmRbZkFY3EBq0RP
         ltaKeAgn9JgQ6rbL//CQMVnn6StAXhe++6V+He/3sGKojJp4rrhVQpjtlMEnWttdqpNB
         779g0WGdDStyT4jePudG+nCHFMb/CsvL+xsJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=frW6SwGVKr+gYsdpZtEXAzu0SF2qdOu8fdHNMktMUqQ=;
        b=DkvTnS8Zp/5gPM4qLMoIgLRCQj3Nish2NyxPAIbYnApCVo/SmdD+blhQ+NenxzDG77
         rWJ1nn4QqOCmuQl/DWFlYW9/OaxUMaRgcycaRYpU+HTMwucPinDBzBR9PVap7bEq2cLv
         LdCJhqg2wTD4E221PJ/LwQL6n3zVzHO6yoOSill9IsZBA3es0DXJ8PMmAbO2QT5Dz8gz
         LB1dYtsH5TqIV2X8n21kznSpY7EK1YxgdbsAIL7G5cBrp2wQTykursj69YxxXAJeZZFN
         nXhytArLE2SNgOVGFje2R+DBbv5VgZ1nj7EqCPtirZdJwL6Q1J7sRI4lwyFty9B81q+o
         5qBw==
X-Gm-Message-State: AOAM533SJAf0VNjYgB5yHEtUPE/8ii3xOrdtBKby1Jal+DsF3hVwiu1Q
        Kbq1E3v2hQ43dkKOk3A8FEb38nlJshRLwi918JVtQw==
X-Google-Smtp-Source: ABdhPJwSmFCa8LoNffG9YCtwwlsceMMhE/j8i64dmYL3fY7S1wJNC0NbUjxPFudTYoOjQJUIgC8pEKRiJWwGMqLLzOw=
X-Received: by 2002:a05:620a:2790:: with SMTP id g16mr48215499qkp.403.1637593654462;
 Mon, 22 Nov 2021 07:07:34 -0800 (PST)
MIME-Version: 1.0
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local> <878rxgntnz.fsf@intel.com>
In-Reply-To: <878rxgntnz.fsf@intel.com>
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date:   Mon, 22 Nov 2021 10:07:23 -0500
Message-ID: <CAMwyc-QUkZy_=ji8L75X_L1B1qPU3ua=MhBeHMk6H9ACk_Zaiw@mail.gmail.com>
Subject: Re: lore+lei: part 2, now with IMAP
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, 22 Nov 2021 at 09:37, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Fri, 12 Nov 2021, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> > For our example query today, we'll do some stargazing. The following will show
> > us all mail sent by Linus Torvalds:
> >
> >     f:torvalds AND rt:1.month.ago..
>
> IMHO you're making the prefixes too short at the cost of not being clear
> or easy to remember for the casual user. f? rt?
>
> For example, the same query using Notmuch (which also uses Xapian as the
> backend) would be:
>
>         from:torvalds AND date:1month..
>
> I'm not convinced the brevity is all good here, YMMV.

Pretty sure public-inbox just uses mairix-style queries here, so it's
really an "vi vs. emacs" kind of discussion.
http://manpages.ubuntu.com/manpages/bionic/man1/mairix.1.html

-K
