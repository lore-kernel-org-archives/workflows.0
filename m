Return-Path: <SRS0=q5JR=Y6=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2C1C5DF65
	for <workflows@archiver.kernel.org>; Wed,  6 Nov 2019 20:50:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88F4F2166E
	for <workflows@archiver.kernel.org>; Wed,  6 Nov 2019 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573073455;
	bh=XyuzhIfs26N7tWZ0czS6Ajn9Y8agYjLoaKNUP3uy41c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=yaliXS3vXcJ289damUkyeWONOWB8oRaSc9djFnJGa2id1rWH1wiXyqFc6aPpvo3Di
	 No4J+Mh/5m9zv7jzf8qos7KHQIRbvY0MwA6X8jkOsbzrTB+UvRrUFLy/Bzi0S7f5cw
	 9Gl/qfNoHTASXpBO2ccDWo/flKyfom9Xge9zvQf0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbfKFUuz (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 6 Nov 2019 15:50:55 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:43297 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbfKFUuz (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 6 Nov 2019 15:50:55 -0500
Received: by mail-qv1-f66.google.com with SMTP id cg2so2029989qvb.10
        for <workflows@vger.kernel.org>; Wed, 06 Nov 2019 12:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=4f3IUA3ryjvtrex+pfGYubcW/QDJGgYDYzirf4FVAPo=;
        b=G2JqRSjpKGWyxXEIWpeV6ANEFbMhRD3purbR/kx3EwtDLAg/I9RGd6kIQ5IKfFv8GT
         pSSdDjhKvigqb4K2om129qjAiz9cFZC85iwtAQ5qHb9watHQvTSwjoRfIGETVe9PFHsX
         0+hhJa97/AnuFqh7eoja5gB6M8WlxB1myxZGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=4f3IUA3ryjvtrex+pfGYubcW/QDJGgYDYzirf4FVAPo=;
        b=VRq1nWMQae2LEHj46AkX0iI9MhuciGB/siJT6fCPhKHKtz1kX9AUwu/0KAZfbSvkD4
         q+/DW1N6VXVymNrt+32aAsoBibsxXsAe81M33eY3ew4NjqEWbvTae3K8OpSh/++FIZ3e
         Y7m8AkE9IHiWaWyv/5+FE69wqGSuTxnnS7/IZoAh3nLzjPg5R5Vb4xgGaJqAbF2dSR/Q
         prfm7+dPr19q8RCNCzEdpi+qen5CjWhqLX7FySUBIR/MVpwJ77LXH9G81yq/JWXYNan9
         JP972IV/1CUh2PLpCWNe0pQxx9coPsydNXPvngXU2+I+6S0xZ2/A8j3ViDcpctgufirv
         iS1A==
X-Gm-Message-State: APjAAAUB2GEFfPtzhmAHjTaafRVP5sVFLCm23e2padGzlYXBlxa3tWws
        DWZ3VGfqZSPKBb8xvCASvUHNSg==
X-Google-Smtp-Source: APXvYqyTZhoglt8RGHU3d+m7Q5yS7SsV2J3r8+ZCqbGpD8peVfEnmGnjJzsKc9mZyxgQHWSnWTznLA==
X-Received: by 2002:a0c:b88f:: with SMTP id y15mr4394906qvf.161.1573073453794;
        Wed, 06 Nov 2019 12:50:53 -0800 (PST)
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id v20sm2159585qkg.92.2019.11.06.12.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 12:50:53 -0800 (PST)
Date:   Wed, 6 Nov 2019 15:50:51 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Daniel Axtens <dja@axtens.net>
Cc:     Dmitry Vyukov <dvyukov@google.com>, workflows@vger.kernel.org,
        automated-testing@yoctoproject.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
Subject: Re: Structured feeds
Message-ID: <20191106205051.56v25onrxkymrfjz@chatter.i7.local>
Mail-Followup-To: Daniel Axtens <dja@axtens.net>,
        Dmitry Vyukov <dvyukov@google.com>, workflows@vger.kernel.org,
        automated-testing@yoctoproject.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Nov 07, 2019 at 02:35:08AM +1100, Daniel Axtens wrote:
>This is an non-trivial problem, fwiw. Patchwork's email parser clocks 
>in
>at almost thirteen hundred lines, and that's with the benefit of the
>Python standard library. It also regularly gets patched to handle
>changes to email systems (e.g. DMARC), changes to git (git request-pull
>format changed subtly in 2.14.3), the bizzare ways people send email,
>and so on.

I'm actually very interested in seeing patchwork switch from being fed 
mail directly from postfix to using public-inbox repositories as its 
source of patches. I know it's easy enough to accomplish as-is, by 
piping things from public-inbox to parsemail.sh, but it would be even 
more awesome if patchwork learned to work with these repos natively.

The way I see it:

- site administrator configures upstream public-inbox feeds
- a backend process clones these repositories
   - if it doesn't find a refs/heads/json, then it does its own parsing 
     to generate a structured feed with patches/series/trailers/pull 
     requests, cross-referencing them by series as necessary. Something 
     like a subset of this, excluding patchwork-specific data:
     https://patchwork.kernel.org/api/1.1/patches/11177661/
   - if it does find an existing structured feed, it simply uses it (e.g.  
     it was made available by another patchwork instance)
- the same backend process updates the repositories from upstream using 
   proper manifest files (e.g. see 
   https://lore.kernel.org/workflows/manifest.js.gz)

- patchwork projects then consume one (or more) of these structured 
   feeds to generate the actionable list of patches that maintainers can 
   use, perhaps with optional filtering by specific headers (list-id, 
   from, cc), patch paths, keywords, etc.

Basically, parsemail.sh is split into two, where one part does feed 
cloning, pulling, and parsing into structured data (if not already 
done), and another populates actual patchwork project with patches 
matching requested parameters.

I see the following upsides to this:

- we consume public-inbox feeds directly, no longer losing patches due 
   to MTA problems, postfix burps, parse failures, etc
- a project can have multiple sources for patches instead of being tied 
   to a single mailing list
- downstream patchwork instances (the "local patchwork" tool I mentioned 
   earlier) can benefit from structured feeds provided by 
   patchwork.kernel.org

>Patchwork does expose much of this as an API, for example for patches:
>https://patchwork.ozlabs.org/api/patches/?order=-id so if you want to
>build on that feel free. We can possibly add data to the API if that
>would be helpful. (Patches are always welcome too, if you don't want to
>wait an indeterminate amount of time.)

As I said previously, I may be able to fund development of various 
features, but I want to make sure that I properly work with upstream.  
That requires getting consensus on features to make sure that we don't 
spend funds and efforts on a feature that gets rejected. :)

Would the above feature (using one or more public-inbox repositories as 
sources for a patchwork project) be a welcome addition to upstream?

-K
