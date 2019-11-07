Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC8CC5DF60
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 11:09:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67D1B2087E
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 11:09:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="MoOPexPA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387811AbfKGLJ3 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 06:09:29 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38955 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbfKGLJ2 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 06:09:28 -0500
Received: by mail-pf1-f196.google.com with SMTP id x28so2481094pfo.6
        for <workflows@vger.kernel.org>; Thu, 07 Nov 2019 03:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=jov/6IzR0KHmIzvCZ10Z8oopEFRwKQs72CB5u/C3abw=;
        b=MoOPexPA9mGWN99xMAmyjcctbd2ixDjWR62de0HkIMFxlHWuW8FaPGiV4jFvA54JXL
         L6tMCmkeKnGXIhrIjROaME1BGdqso0G3EHo/q/ROhn2s3RdsSY3eqe/FWWKXo+r9+0QW
         0TiZJUiywyzp6OasiFK7Ik2Cl5DMNMlUYuxzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=jov/6IzR0KHmIzvCZ10Z8oopEFRwKQs72CB5u/C3abw=;
        b=iBhSKGezVzkM0Wp1PHuoKsNH8Js61KZ3dVB92wqHjOkYJ63prK254fbITyBa5MBCNy
         GqufMVJTeYDjuQqAEAI0R/bzuM6GFr7hJ+rJxWUptLv/nyk7naRhE49aPuph0MHgXxWw
         h4p3JIwfF8S1dZG30R7zVkQf4DJOZxufJNNrpb8dS7m5ziZkEi+5HsirKF/69ykrnSfh
         y3+wuVck6f6B9DSSGnpNbTCW/BBg2EOIc9qDHkMpSaYmHU7+PZ120uq8PraMHthHBoqI
         YITwHkt7DQLXNOc4KEnxZ/lxzCx7Y4Xcy1RApVWRgLJn5GdNcwEx/RT8lYb/xedfn1oj
         yuPA==
X-Gm-Message-State: APjAAAXmLnlRD8G008W8VWW7RfWaihy3T20NAb6y3K2MoG5aNd+bs7cJ
        TPVoexEdeAnHA6QIriKRxbVHAA==
X-Google-Smtp-Source: APXvYqxEW0U7QCIOyOGItfhQGlPCPQTgZ4lLioUTuQo1yh7EEYOJ9pBD+uMVYQTLLjCOml9eCg1GuA==
X-Received: by 2002:aa7:9482:: with SMTP id z2mr3226893pfk.98.1573124968100;
        Thu, 07 Nov 2019 03:09:28 -0800 (PST)
Received: from localhost (2001-44b8-1113-6700-40d3-eca3-e70b-6bc4.static.ipv6.internode.on.net. [2001:44b8:1113:6700:40d3:eca3:e70b:6bc4])
        by smtp.gmail.com with ESMTPSA id y4sm2082520pfn.97.2019.11.07.03.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 03:09:27 -0800 (PST)
From:   Daniel Axtens <dja@axtens.net>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        patchwork@lists.ozlabs.org
Cc:     Dmitry Vyukov <dvyukov@google.com>, workflows@vger.kernel.org,
        automated-testing@yoctoproject.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
Subject: Re: Structured feeds
In-Reply-To: <20191106205051.56v25onrxkymrfjz@chatter.i7.local>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com> <8736f1hvbn.fsf@dja-thinkpad.axtens.net> <20191106205051.56v25onrxkymrfjz@chatter.i7.local>
Date:   Thu, 07 Nov 2019 22:09:24 +1100
Message-ID: <87r22kgcyj.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Sending on to the patchwork list for discussion. I think at least some
of this makes sense for Patchwork to support, I'll do a more detailed
analysis/breakdown later on.

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Thu, Nov 07, 2019 at 02:35:08AM +1100, Daniel Axtens wrote:
>>This is an non-trivial problem, fwiw. Patchwork's email parser clocks 
>>in
>>at almost thirteen hundred lines, and that's with the benefit of the
>>Python standard library. It also regularly gets patched to handle
>>changes to email systems (e.g. DMARC), changes to git (git request-pull
>>format changed subtly in 2.14.3), the bizzare ways people send email,
>>and so on.
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
> - the same backend process updates the repositories from upstream using 
>    proper manifest files (e.g. see 
>    https://lore.kernel.org/workflows/manifest.js.gz)
>
> - patchwork projects then consume one (or more) of these structured 
>    feeds to generate the actionable list of patches that maintainers can 
>    use, perhaps with optional filtering by specific headers (list-id, 
>    from, cc), patch paths, keywords, etc.
>
> Basically, parsemail.sh is split into two, where one part does feed 
> cloning, pulling, and parsing into structured data (if not already 
> done), and another populates actual patchwork project with patches 
> matching requested parameters.
>
> I see the following upsides to this:
>
> - we consume public-inbox feeds directly, no longer losing patches due 
>    to MTA problems, postfix burps, parse failures, etc
> - a project can have multiple sources for patches instead of being tied 
>    to a single mailing list
> - downstream patchwork instances (the "local patchwork" tool I mentioned 
>    earlier) can benefit from structured feeds provided by 
>    patchwork.kernel.org
>
>>Patchwork does expose much of this as an API, for example for patches:
>>https://patchwork.ozlabs.org/api/patches/?order=-id so if you want to
>>build on that feel free. We can possibly add data to the API if that
>>would be helpful. (Patches are always welcome too, if you don't want to
>>wait an indeterminate amount of time.)
>
> As I said previously, I may be able to fund development of various 
> features, but I want to make sure that I properly work with upstream.  
> That requires getting consensus on features to make sure that we don't 
> spend funds and efforts on a feature that gets rejected. :)
>
> Would the above feature (using one or more public-inbox repositories as 
> sources for a patchwork project) be a welcome addition to upstream?
>
> -K
