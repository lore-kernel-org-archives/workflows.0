Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E95CC5DF61
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 10:44:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D421C2178F
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 10:43:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VoxKSBGF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbfKGKn7 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 05:43:59 -0500
Received: from mail-qk1-f169.google.com ([209.85.222.169]:45697 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727528AbfKGKn7 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 05:43:59 -0500
Received: by mail-qk1-f169.google.com with SMTP id q70so1487868qke.12
        for <workflows@vger.kernel.org>; Thu, 07 Nov 2019 02:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qHfrHOoabaTx0CJXpcZKku3L5/5Fpb4ganfPz9RzuH4=;
        b=VoxKSBGF1Qvjp/8B+1PrNIc1or1pWiRrCEq7m2rwewC14eTO50k+iyMkLzBkygVdQL
         BdYGcMM3hBx3CB/9ZgcoyJF/iQYZy5HEuTr0Ry5Ruu/Hrgpwmw2ZHJr5HxuoRCzTMqLT
         sbwbLVwcr8IdmX3OLWm2CYR1X9GLdT2a2P0+9uWE/yG7tVsNkDumP1eAYiiFaULXu0ga
         QxECeZJIkp4BWMsR1I3uXg9V4h2QO+vHIO9ktZWGcGj4jjow28kApxjlSvVhuY0DTuWM
         EJAizxL5iPleJuTKMRWElB5zVEB6W2X+TUxtR2rDFRMKhHv4BxaZoMzRpYCl6XGmS7cS
         /JJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qHfrHOoabaTx0CJXpcZKku3L5/5Fpb4ganfPz9RzuH4=;
        b=D5VofUpEisfxNuKZXuLKzNYDW+iKM2lzx7QPiX9LMcH9wHw2rRHnXc/gjFv/Loxo1/
         /XlwDyKWo4gycllGsmtxioUjfZQQ5GgR4DJcpOU6ErehPMMgsHsWYZ5BwCEGJZbeMJDr
         js6HUSouKcDDuJZ+VrwKyM3SMIvowgvFpTiEt1BVou7uCoGgSQxm4ISmTNxLg/ZY7F/h
         fbFCO7o/meuZPNXO/w5fccRHksDr9uazgeLbVUcCPEQnNSzt5YZPCHC6zK/AOVCMLYLO
         Va20JHRaAUmKfOTzgplqTVzE8Q2UKCJVPqqh74u3K0eLlAbcx+lOh3z50je+uGRISDHU
         97NQ==
X-Gm-Message-State: APjAAAV3JEUrahgQ37WmOMbNg5ivdvn6bTURRb+fFSfLTe4Vs+P9n449
        fO5rMNUAn4H91rZ3bftuvBCFuJ4vb2B7aj18HA0EzaEFI6U=
X-Google-Smtp-Source: APXvYqyVVcor4Z50aSdo/NLuNTcA9OhA681ovnSMcMg/E28Z1klXCPpKZ5q41tpF5YruuD0hkfFHPpnLfM3c1GS18nI=
X-Received: by 2002:a37:6845:: with SMTP id d66mr1912022qkc.407.1573123437237;
 Thu, 07 Nov 2019 02:43:57 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <8736f1hvbn.fsf@dja-thinkpad.axtens.net> <CACT4Y+Z2PJ=L+5_a=tmxkTLz7puGh4Yx0+uPPk999p-S4Zmi_A@mail.gmail.com>
 <87woccgea3.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87woccgea3.fsf@dja-thinkpad.axtens.net>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 7 Nov 2019 11:43:45 +0100
Message-ID: <CACT4Y+Z1sL_Ag51T3N0nhf35N-aYMQ1pzenVwSRRR0=VUBvMCQ@mail.gmail.com>
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

On Thu, Nov 7, 2019 at 11:41 AM Daniel Axtens <dja@axtens.net> wrote:
>
> Dmitry Vyukov <dvyukov@google.com> writes:
>
> > On Wed, Nov 6, 2019 at 4:35 PM Daniel Axtens <dja@axtens.net> wrote:
> >>
> >> > As soon as we have a bridge from plain-text emails into the structured
> >> > form, we can start building everything else in the structured world.
> >> > Such bridge needs to parse new incoming emails, try to make sense out
> >> > of them (new patch, new patch version, comment, etc) and then push the
> >> > information in structured form. Then e.g. CIs can fetch info about
> >>
> >> This is an non-trivial problem, fwiw. Patchwork's email parser clocks in
> >> at almost thirteen hundred lines, and that's with the benefit of the
> >> Python standard library. It also regularly gets patched to handle
> >> changes to email systems (e.g. DMARC), changes to git (git request-pull
> >> format changed subtly in 2.14.3), the bizzare ways people send email,
> >> and so on.
> >>
> >> Patchwork does expose much of this as an API, for example for patches:
> >> https://patchwork.ozlabs.org/api/patches/?order=-id so if you want to
> >> build on that feel free. We can possibly add data to the API if that
> >> would be helpful. (Patches are always welcome too, if you don't want to
> >> wait an indeterminate amount of time.)
> >
> > Hi Daniel,
> >
> > Thanks!
> > Could you provide a link to the code?
> > Do you have a test suite for the parser (set of email samples and what
> > they should be parsed to)?
>
> Sure:
> https://github.com/getpatchwork/patchwork in particular
> https://github.com/getpatchwork/patchwork/blob/master/patchwork/parser.py and
> https://github.com/getpatchwork/patchwork/tree/master/patchwork/tests

Added here for future reference:
https://github.com/dvyukov/kit/blob/master/doc/references.md#patchwork
Thanks!
