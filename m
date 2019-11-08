Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8320EFA372C
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:18:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 434D221924
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 14:18:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="mg2UATa7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfKHOSV (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 09:18:21 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46262 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfKHOSU (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 09:18:20 -0500
Received: by mail-pl1-f194.google.com with SMTP id l4so4108726plt.13
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 06:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=R5A/42JyG0BJn6NT9c4LTkTHsN0fzAtt061vA1EjK1E=;
        b=mg2UATa7jVUxXVZreYvJb39pw5NX5Nj91g5cd9Kbj2k1p893+Mj/G1qp7Iabl6uA7g
         L7eo0oihm1Pa3DMbMvGhmT3qSQqMdrFDMNRLfys+m0Li46OMtPCTptKecCf9WU7gN5+z
         k7y+aWVvijnsErywmj4QlW8L9Rz0RTsL+sBIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=R5A/42JyG0BJn6NT9c4LTkTHsN0fzAtt061vA1EjK1E=;
        b=W6bMIo46k51BSLCVAi5rsfL/ot7VlSbisiBo8h3VjTRnXsmQiwJhwr9iYu76wlu+lp
         03Vop5nnZCsXwjImSP1BTD/cFEHaTf5utUTybYAMGVtVbBfX4090B2KSzA6l6sI54Nvc
         RqMW8pPfY4RAN/j+n89ryT5kzd1aCQRFsKYT9BWnnmmr4qFnJeqx6F31EiPg9sa4l+Ol
         RAmGCRHUqIf1ljgsYCmXXNThw9Th9guYoPQE/79ZpaO8P+FfpBRZ3r0z/TwsX8nkNybI
         EE1DhRhU6UCXJSf28MT8VY768WqWm4iaea7iPgr7k7CqGJyAWRgNmkyN/oZyClzruIG8
         WEew==
X-Gm-Message-State: APjAAAXfqVuk5CsYfbUzMwiOy5rjpE9GR0ymVStHEAk1cpMLIz4NHAYm
        X4ZEcJRzvxZRO8pLungdRMvOKA==
X-Google-Smtp-Source: APXvYqwn45qvJWMxKazFNONnRHZsOMp5AqJsbmRmyKx/8PklDKty1Q7SsbxRW0u92GHLGWfyd95W+Q==
X-Received: by 2002:a17:902:a717:: with SMTP id w23mr10999187plq.27.1573222699218;
        Fri, 08 Nov 2019 06:18:19 -0800 (PST)
Received: from localhost (2001-44b8-1113-6700-40d3-eca3-e70b-6bc4.static.ipv6.internode.on.net. [2001:44b8:1113:6700:40d3:eca3:e70b:6bc4])
        by smtp.gmail.com with ESMTPSA id 9sm5833573pfn.113.2019.11.08.06.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 06:18:18 -0800 (PST)
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
Date:   Sat, 09 Nov 2019 01:18:14 +1100
Message-ID: <87h83eh2op.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


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

This is very confusing to me. Let me see if I have it correct.

You want to split out a chunk of parsemail that takes email messages,
either from regular email or from public-inbox, and spits out a
structured feed.

You then want patchwork to consume that structured feed.

I don't know how that would work architecturally - converting emails
into a structured feed requires a lot of the patchwork core.

It would be a lot simpler from the patchwork side to teach parsemail to
be able to consume a public-inbox git feed, and write an API consumer
that takes the structured data that Patchwork produces, strip out the
bits you don't care about, and feed it into other projects.

>
> I see the following upsides to this:
>
> - we consume public-inbox feeds directly, no longer losing patches due 
>    to MTA problems, postfix burps, parse failures, etc

This much I am OK with as an additional option for sites. FWIW,
consuming a public-inbox feed doesn't protect you against most parse
failures - they are due to things like duplicate message-ids and bad
mail from the sender end. It should prevent against issues due to
postfix invoking multiple parsemails in parallel, but that shouldn't be
losing patches, just getting series metadata wrong.

> - a project can have multiple sources for patches instead of being tied 
>    to a single mailing list

You can get around this pretty easily now with the --list-id=parameter,
and I think the netdev patchwork might do this to grab bpf patches? I
think there's a little shim at OzLabs that does this.

I also don't see how a public-inbox feed helps. Currently pw determines
the list based on a header in the email, unless overridden. public-inbox
emails will also have that header, so either patchwork looks at those
headers or you tell patchwork explicitly that a particular public-inbox
feed corresponds to a particular list. Either way I think this leaves
you in the same situation you were in before, unless I have
misunderstood...

> - downstream patchwork instances (the "local patchwork" tool I mentioned 
>    earlier) can benefit from structured feeds provided by 
>    patchwork.kernel.org

Do I understand correctly that this is basically a stripped-down version
of what the API provides, but in git form?

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

I think a lot about patchwork development in terms of good incremental
changes. This is largely because maintainers get quite cross with us if
we break things, and I don't like that.

What I would be happy with as a first step (not necessarily saying this
is _all_ I would accept, just that this is what I'd want to see _first_)
is:

 - code that efficiently reads a public-inbox git repository/folder of
   git repositories and feeds it into the existing parser. I have very
   inefficient code that converts public-inbox to an mbox and then
   parses that, but I'm sure you can do better with a git library.

 - careful thought about how to do this incrementally. It's obvious how
   to do email incrementally, but I think you need to keep an extra bit
   of state around to incrementally parse the git archive. I think.

 - careful thought about how to do this in a way that doesn't require
   sites that don't want to load public-inbox feeds to install lots of
   random git-parsing code.

Once you can do that, I'm happy to think more about your more ambitious
plans.

Regards,
Daniel

>
> -K
