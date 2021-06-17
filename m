Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA358C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 09:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE0FF61920
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 09:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhFQJy1 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 05:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbhFQJy0 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 05:54:26 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B67A9C061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 02:52:17 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id e3so4272362qte.0
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 02:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3ONwryvJZrOyMW6kJaFIhOfOW2f3Bk8OLuySILRaxtE=;
        b=cui+oiynmatbBkAAZTy3C1NPKiRO3PwUHr5vgY00gNlWYsJd489SoP62L5I/HWg0YB
         c+3x2gfhcGNem4HoolEtu+YGVZsDgcABBUUiSwc6MthCuEaX6cw2Rg7+4Oh0l7iEnVwx
         xi6/u1+G4gp4FdJY2BU9nklEMyNTNBTJvkn/twAfNevu9nHsceuGwxF+lVoCRrskzcKe
         KB1zjpPVMD2gVbpF30+hkTSrfLOGnr2NT3VnRISx1AagnrNuuN+OvsyECUXqzuz0yTyC
         Ml3r8xFxB7zQbyBasqQQPVs08I8ZS+g76g0Ro9Zdsz9tJVXXY5doj7Yq4n62RkXrfVOP
         a3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ONwryvJZrOyMW6kJaFIhOfOW2f3Bk8OLuySILRaxtE=;
        b=R5Iva1LMj9u4+PF2CKG5eXV9z9DjM2NVlhg3wAuOFoj8T8rgzTOIs4fim5fVZLtI9r
         n0xaqXxzVvqRDNfe7jTgQfbCivhqjZtd5/N30Qj/jtGquiCno5Glajcs5u5n6s5Ndz6L
         wpofqmsAGdUGYbsUlV9KpgDBw5LLVmRFjZ4kYywUMCHfPEllnYyxGUnYcTfovmXAo9gi
         iBxsiGJE1qVxNhUYt7qAO0euHcTpU+TCU/WuWoeKG5etoViSNHFrvweuTtnvsjxqdbCt
         Bfo1TjXAO6U7IeuRJ65v06jq4vKSu/urSv0I3pP6Sb4ebLUgjdP6KmlZIUiv1+Js4kOw
         3c3Q==
X-Gm-Message-State: AOAM532MnN89NxgG4WwwFHyyTT7q2zA21KoHJy07LF0PQmOqJN4eGN6B
        D7+hxrpet5nfFBwUJ6TD4ZKI/T32WXHlSQr4ss9LEmwJb/g5qA==
X-Google-Smtp-Source: ABdhPJww5fJ3vxEb2hnAbPLC01Cj/rifX+jRZg5avVK5YXaKV5NrmNQUFsInjvY5ITfkU+PFRmbVqgPwKbSHyGV9fnI=
X-Received: by 2002:a05:622a:510:: with SMTP id l16mr4274045qtx.66.1623923536056;
 Thu, 17 Jun 2021 02:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <YMsGoI0UdbmUebhX@infradead.org>
 <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 17 Jun 2021 11:52:04 +0200
Message-ID: <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 10:33 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 17 Jun 2021, Christoph Hellwig wrote:
>
> > Please opt all subsystems I maintain out of this crap.  The last thing
> > I need is patches from people that can't deal with a sane workflow.
>
> I agree with Christoph. This (if at all) really needs to be on an explicit
> maintainer opt-in basis only (and I am not going to opt in with my
> subsystems :) ).

Hi Jiri, Christoph,

You don't want to accept these contributions even if you won't be able
to tell the difference on your end? But why? This looks really
orthogonal to a person's expertise and proficiency in software
development. Whether that's inability to deal with email, or no desire
to spend time on that, or just personal preferences.

On the other hand this workflow has the potential to ensure that you
never need to remind to run checkpatch.pl, nor spend time on writing
code formatting comments and re-reviewing v2 because code formatting
will be enforced, etc. So I see how this is actually beneficial for
maintainers.

For what it's worth I currently can't send emails with git because
Gmail with phone auth does accept plain passwords nor ASP. As far as I
understand proper two-factor auth would work, but phone auth is
different (kind of 1.5-factor). I know it's solvable, e.g. I can get
another account somewhere, but I don't see setting this up and
maintaining and checking a second account as a worthy time investment.
