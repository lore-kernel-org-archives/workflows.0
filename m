Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3AAC5DF61
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 09:14:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B6D282187F
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 09:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wTl38Jxp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387817AbfKGJOI (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 04:14:08 -0500
Received: from mail-qk1-f180.google.com ([209.85.222.180]:46343 "EHLO
        mail-qk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733170AbfKGJOI (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 04:14:08 -0500
Received: by mail-qk1-f180.google.com with SMTP id h15so1294534qka.13
        for <workflows@vger.kernel.org>; Thu, 07 Nov 2019 01:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oqN/714hHwUvSBoIsLj8UU2NSiFcay6/GB1V3iEKfO0=;
        b=wTl38JxpPqrvMBiOAxI1CYeHX50baT90mODSJ8kHhLqI0tPvhXB8R4camF/Xv3rDWW
         a6qGBSUldOaK3hbdo7f+a+1nI4g/rnZYKrGwywgo2Fp3Vz1aw2JnrGm0L2MpC/FaHwdn
         UYZEF8N2p2JnlohnMmt2MtDOg48buxLO5CPNhSc1iyyqSpRiWnMzGuCaFOwO9xYcH4TU
         eInIkxyn80bS+Rk+THuCc+kd0aRK03fd0W8FE57BgqfU5NB+ncFJe6+tGy23Jh8AjkgU
         iUWt4jGbIR1s3Rhk6Y7axU6xAD6kOJ1YVCa5eVdoaWLBqV+jZe9fK9tj0K7sWx2kY5IP
         ca6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oqN/714hHwUvSBoIsLj8UU2NSiFcay6/GB1V3iEKfO0=;
        b=gt2JqQu9QabzZEN72XQP3kO56uRcdTzcUxXcOQLm9E+7+ibkatVf4W1/oLpl57ZR38
         8vsuQdAXq0SzLunXoLLb5ADpDavHLnmh8rjJbQ2d1ZGeiTdsZIKtuprAI5HTY84pXvOp
         2OkPJuXXl1WbFzoAXWVKh5Q5YY7zSKbS0PJs+m4zD5hh39bCqKlRDPFGb/cafl9ZOAtG
         PVzkHMCFiWl1S/+Xi14ME/F7cA8fbhUvwwJXpCavuKE19K6sufYwZyY7HCkSlTS+rh8a
         n2QUewoU6oqdFzeYIeika1lcpBmc1GSWEMKU14gqXOqrtKME/DmHCMRqZK1nWDdzJTpv
         J/mg==
X-Gm-Message-State: APjAAAUjiLcVST8Z+wfzvnfJbi8MKTJfeGPsMezJZqsugipt9jIs50V2
        TNwmYx+xeqgxO9dlWtCXORR94zX5x7akYIN6TN4+tkTG0yM=
X-Google-Smtp-Source: APXvYqzRU7f1W5tD+sQsk6wthSJRBwzIM4dq+u6/awh4THyP/hCQirp+KOx0nqdWi5Zvzeklm3u0pWCVWLg3yVRzEsQ=
X-Received: by 2002:a05:620a:14b9:: with SMTP id x25mr1814758qkj.8.1573118045760;
 Thu, 07 Nov 2019 01:14:05 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF977D94C0@USCULXMSG01.am.sony.com>
In-Reply-To: <ECADFF3FD767C149AD96A924E7EA6EAF977D94C0@USCULXMSG01.am.sony.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 7 Nov 2019 10:13:54 +0100
Message-ID: <CACT4Y+bMxZ1b_83t_UbWC9VoH388jwWZDBUD3avE9mTc9z7dQw@mail.gmail.com>
Subject: Re: [Automated-testing] Structured feeds
To:     Tim Bird <Tim.Bird@sony.com>
Cc:     workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Han-Wen Nienhuys <hanwen@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Nov 7, 2019 at 9:48 AM <Tim.Bird@sony.com> wrote:
> > -----Original Message-----
> > From: Dmitry Vyukov
> >
> > This is another follow up after Lyon meetings. The main discussion was
> > mainly around email process (attestation, archival, etc):
> > https://lore.kernel.org/workflows/20191030032141.6f06c00e@lwn.net/T/#t
> >
> > I think providing info in a structured form is the key for allowing
> > building more tooling and automation at a reasonable price. So I
> > discussed with CI/Gerrit people and Konstantin how the structured
> > information can fit into the current "feeds model" and what would be
> > the next steps for bringing it to life.
> >
> > Here is the outline of the idea.
> > The current public inbox format is a git repo with refs/heads/master
> > that contains a single file "m" in RFC822 format. We add
> > refs/heads/json with a single file "j" that contains structured data
> > in JSON format. 2 separate branches b/c some clients may want to fetch
> > just one of them.
>
> Can you provide some idea (maybe a few examples) of the types of
> structured data that would  be in the json branch?

Hi Tim,

Nobody yet tried to define exact formats. Generatelly it should expose
info about patches, comments, test results in an easy to consume form.
Here are examples for patchwork, git-appraise and gerrit:
https://patchwork.ozlabs.org/api/patches/?order=-id
https://github.com/google/git-appraise/tree/master/schema
https://lore.kernel.org/workflows/87sgn0zr09.fsf@iris.silentflame.com/T/#m3db87b43cf5e581ba4d3a7fd5f1fbff5aea3546a
I would expect that the format would resemble these formats to
significant degree. But I guess we need to come up with something, try
to use, see what's missing/needs to be improved and iterate.
Do you have any specific recommendations or ways in which you see it
will be consumed?
