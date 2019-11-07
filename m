Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F725C5DF61
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 09:08:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F6562178F
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 09:08:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rBCKCYh1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733164AbfKGJI2 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 04:08:28 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39138 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733139AbfKGJI2 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 04:08:28 -0500
Received: by mail-qt1-f194.google.com with SMTP id t8so1630435qtc.6
        for <workflows@vger.kernel.org>; Thu, 07 Nov 2019 01:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=akJhiDzu+V1Swa8nvD7f91wkwGyNCGEzgo1qLR+8GwQ=;
        b=rBCKCYh14VqjrfdFWho3zpw9f2CN36/mrdZfVU/eqMsOAbStKxc77r2JG1Oz8pLhKp
         47WlmK8NxtZ6hOESk4q/xB7EMsLIOclSu9sRmPqTBFgzJAGNcbRe0qubdZdKK6ORB9tA
         3G9yOnmLGtoMTyOwesNWPa3MSfOC5ZuurhvuxAnXpY1iclXGyvYKzjCsFhDaILE9tfRk
         +yMo9w9a7tImDtWb0Kk9QDaeU/vXei8G76FrltsDRkL5XfBCMhXblekWGUoCGIrUWC/r
         vXlgrdpwK9xPJKaykqgO8ESo0q8e8/KhvdLpnUZL+fQGwpXfZGfqopKT2zMsbfp1Wk7/
         SJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=akJhiDzu+V1Swa8nvD7f91wkwGyNCGEzgo1qLR+8GwQ=;
        b=T8JovAI+1K4pyijI2GOP0L7TE7QfEw5XljLEYcexLtatqJHlBsaLCpWqjpDfgIX7Ns
         IgC6kqG/G/4qH9BeHJUMGx/O2l0SJNgERZxjOXzz5JB/tod89tj2FJAGXi5anI+JJTJ2
         n2bttLJLYjLsszQuXUmRnUqA6BuKM+FBr4Tpw0eSZ4gtb0/MxswUiBuM2O5qPvqI9xnO
         zWgMiGCla9lr75VsClxyyW/LzsBHcF1/ZjnjTjeO8XcHMh5vWyqKznGAJVR/GKxLbXzK
         JYO37eyE6PHcXNoihxYFrGHR4j2i/5wBFuVbr8x9MQF55GEo5ZF+HRKY1bltu6YIZSJa
         TU6w==
X-Gm-Message-State: APjAAAW/hl1mQ/3ECsyWDWsfUfW0mE3zqe9j2LdPnQRB7M0tEVUKa53P
        StQWvlgLKmFkkgkBGJ/oSFT3IrTralxmmEZNiPDffQ==
X-Google-Smtp-Source: APXvYqy9yFm8NlgMdolxLuMWP0kWig6hBXgpEkSBTPbUj5Hm0gMcr3qxknGpbJ0Q+nH5LA1wI5BkC3RF5PJPBdN4jjk=
X-Received: by 2002:aed:24af:: with SMTP id t44mr2513653qtc.57.1573117707070;
 Thu, 07 Nov 2019 01:08:27 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <8736f1hvbn.fsf@dja-thinkpad.axtens.net> <20191106205051.56v25onrxkymrfjz@chatter.i7.local>
In-Reply-To: <20191106205051.56v25onrxkymrfjz@chatter.i7.local>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 7 Nov 2019 10:08:16 +0100
Message-ID: <CACT4Y+Ywzbwz7GNfOCJb+DGdKEdkAh+v+20hmNG7S1riEbhTNA@mail.gmail.com>
Subject: Re: Structured feeds
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Daniel Axtens <dja@axtens.net>, workflows@vger.kernel.org,
        automated-testing@yoctoproject.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Nov 6, 2019 at 9:50 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Nov 07, 2019 at 02:35:08AM +1100, Daniel Axtens wrote:
> >This is an non-trivial problem, fwiw. Patchwork's email parser clocks
> >in
> >at almost thirteen hundred lines, and that's with the benefit of the
> >Python standard library. It also regularly gets patched to handle
> >changes to email systems (e.g. DMARC), changes to git (git request-pull
> >format changed subtly in 2.14.3), the bizzare ways people send email,
> >and so on.
>
> I'm actually very interested in seeing patchwork switch from being fed
> mail directly from postfix to using public-inbox repositories as its
> source of patches. I know it's easy enough to accomplish as-is, by
> piping things from public-inbox to parsemail.sh, but it would be even
> more awesome if patchwork learned to work with these repos natively.
>
> The way I see it:
>
> - site administrator configures upstream public-inbox feeds
> - a backend process clones these repositories
>    - if it doesn't find a refs/heads/json, then it does its own parsing
>      to generate a structured feed with patches/series/trailers/pull
>      requests, cross-referencing them by series as necessary. Something
>      like a subset of this, excluding patchwork-specific data:
>      https://patchwork.kernel.org/api/1.1/patches/11177661/
>    - if it does find an existing structured feed, it simply uses it (e.g.
>      it was made available by another patchwork instance)

It's an interesting feature if a patchwork instance would convert and
export text emails to structured info. Then it can be consumed by CIs
for precommit testing and other systems without the need to duplicate
conversion.
