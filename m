Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39ADEC5DF61
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 08:53:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEC242077C
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 08:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ed3q7EHK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfKGIxn (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 03:53:43 -0500
Received: from mail-qk1-f170.google.com ([209.85.222.170]:39423 "EHLO
        mail-qk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727609AbfKGIxn (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 03:53:43 -0500
Received: by mail-qk1-f170.google.com with SMTP id 15so1292883qkh.6
        for <workflows@vger.kernel.org>; Thu, 07 Nov 2019 00:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p3jehICmABjGGN5SiFqa240ovbRheh0U/xOoBZxFEfw=;
        b=Ed3q7EHKj3oQYH4FT9zY3vyfXBuSFVanErQVY2osN5bEUfSdI4X9aB4Ds2la3YBI5v
         Y/gtUCnUK9xdSqt3ofKbiu8n+KiU/2fS+/UuNqLv+bp3Q+XXAJuL783/dYtEt50bzliq
         Hl7Wazn3caYr+aP9I4DYy+sE3mvSCRV9I9kriS9EsGWdcEJyJCB96Ni/HwuPiMt1gm+2
         U5X8xO6rfq8Oh7JxVA4RBDq9LRVhRSOjXrSn6kLhWSclPNwteteSchsOez7HDgYFtFwO
         DSX3pp+dGton6M9OR1cTl1kGiRWNbyhrbbYLO6RSdr5P5pGuMFOmvoA3w95rXUFYdO93
         mKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p3jehICmABjGGN5SiFqa240ovbRheh0U/xOoBZxFEfw=;
        b=SRt+bkimD28HB18GXgNodisX3AeO6nuOi1mhrnPuPsYpYMzcfqgaNzAz3IFvFILloF
         OShot7hZjPtlxsMIuO4JZRSZn/2g98RsgjGcdt6JSP1uvvAkrB3/QzKd0iE2qTNBtl1z
         HJZmKuv5h4Yn2CrcaYBoN1nuDzdkUga+R/rISThV6PAeapxA/PAliI+/uZ/yy1s5Xt/3
         7tMvDf2viX8l+O1A9MWPE8wwAlU9PXdcqBfjnQeBn9tApaPoxc1Mg2lkba5Tw72anqga
         592jBROfdJ+C+sxKHQcQDabYHwY4XhAXmPvwfP/ScDaD+42tln/nlCnilvZm9Amqkdhw
         S2ew==
X-Gm-Message-State: APjAAAWrUX5ZJyplaONXc3FcPcja1dEnbFBJ5B8lEp77VlVKyYFiqPI2
        RF5ejPJxJF6N0HVw+n0uopVDrjJe606kPm/ntzZM1A==
X-Google-Smtp-Source: APXvYqzTk+6XJI3NtjpQZw4O9I8NK3WAZ340nQlboTYPzmx7ktfaBnOQMfquOgifR2/6S5WkdukbnUayxoINcRH8K/g=
X-Received: by 2002:a37:6845:: with SMTP id d66mr1546158qkc.407.1573116821941;
 Thu, 07 Nov 2019 00:53:41 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 7 Nov 2019 09:53:29 +0100
Message-ID: <CACT4Y+Z2PJ=L+5_a=tmxkTLz7puGh4Yx0+uPPk999p-S4Zmi_A@mail.gmail.com>
Subject: Re: Structured feeds
To:     Daniel Axtens <dja@axtens.net>
Cc:     workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Nov 6, 2019 at 4:35 PM Daniel Axtens <dja@axtens.net> wrote:
>
> > As soon as we have a bridge from plain-text emails into the structured
> > form, we can start building everything else in the structured world.
> > Such bridge needs to parse new incoming emails, try to make sense out
> > of them (new patch, new patch version, comment, etc) and then push the
> > information in structured form. Then e.g. CIs can fetch info about
>
> This is an non-trivial problem, fwiw. Patchwork's email parser clocks in
> at almost thirteen hundred lines, and that's with the benefit of the
> Python standard library. It also regularly gets patched to handle
> changes to email systems (e.g. DMARC), changes to git (git request-pull
> format changed subtly in 2.14.3), the bizzare ways people send email,
> and so on.
>
> Patchwork does expose much of this as an API, for example for patches:
> https://patchwork.ozlabs.org/api/patches/?order=-id so if you want to
> build on that feel free. We can possibly add data to the API if that
> would be helpful. (Patches are always welcome too, if you don't want to
> wait an indeterminate amount of time.)

Hi Daniel,

Thanks!
Could you provide a link to the code?
Do you have a test suite for the parser (set of email samples and what
they should be parsed to)?
