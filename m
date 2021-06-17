Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC18FC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 867AC613F8
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbhFQOtx (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 10:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhFQOtx (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 10:49:53 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78AEAC061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 07:47:44 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id o20so4885492qtr.8
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 07:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VdyZg6gJIn6lUngxPHz1VGppSeTBi9l1kxbHLJNG7BA=;
        b=RK+MDH2IJh+k/rbitkUeLXo4ocg+b3Y3ONboKBpd7Oe4blu/hMe0B4YM0WDAxDbG/N
         DxscK5FsTd0QOfsmqk9r4Sdmx9vvbk2eQhjKiPpVwjaBlPhtmUePLystdCDwL1UffjGK
         Ut0m0il0NfOf0ybx1OIjtzUXheK2Wv0NZF7Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VdyZg6gJIn6lUngxPHz1VGppSeTBi9l1kxbHLJNG7BA=;
        b=g3iodLQsgfvj6JEoUp+zi+E4PzAN4YqURGyWHIn2Ik+PHEgY2UxKUGCi/0XfDF+nwU
         +xRvlV3Dn4PVIUNG9iU6qorSHkI7e0hDJmrejQyeXtn2R6HNYUL0oaGhChg8LBn9X8Uc
         N4m4pw4KQZl3dHVl85mBYQllCdvZjcuHDgi5izZw9gNGKj0idW5dlt9GghV9XmjQAtxg
         Qp/QCudvE/OiTm2sUKFyjsSWyRVWxPFFFf5c244sQ0rky7TI2pRPBl+JZxwqFJ0mC/6j
         CwUyK81N8w4gkaGb6JzLAg4H6LrRPdYICOKNxOKbWRTtsV8q3GvDFY2DTCZJ5HM8rfV/
         rH0Q==
X-Gm-Message-State: AOAM532JEmZWQz0Mjc88m6YMubN183brUVHl3qvu8m7DoPl4iH/rqLcR
        SlYIKV4cWKfbkl8tuMWdHNaIOA==
X-Google-Smtp-Source: ABdhPJwZcL19p1I04DjXNDhT1oY0QBOpKLkFZTYrpKv+NOS2ALhgJxh4ddQQndKnyk2Q0TqUogH+dA==
X-Received: by 2002:ac8:7590:: with SMTP id s16mr5475893qtq.259.1623941263551;
        Thu, 17 Jun 2021 07:47:43 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id z136sm1883457qkb.34.2021.06.17.07.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 07:47:43 -0700 (PDT)
Date:   Thu, 17 Jun 2021 10:47:41 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Rob Herring <robh@kernel.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210617144741.jxachwj46ftzlgns@nitro.local>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 03:11:33PM -0600, Rob Herring wrote:
> > I've been doing some work on the "github-pr-to-ml" bot that can monitor GitHub
> > pull requests on a project and convert them into fully well-formed patch
> > series. This would be a one-way operation, effectively turning Github into a
> > fancy "git-send-email" replacement. That said, it would have the following
> > benefits for both submitters and maintainers:
> 
> What makes this specific to Github PRs? A Github PR is really just a
> git branch plus a target at least to the extent we would use it here.
> The more of this that works on just a git branch, the more widely
> useful it would be.

It's not specific to GH at all. The same bot will be able to perform similar
actions to emails created by git-request-pull, e.g.:

- submitter runs git request-pull instead of git-format-patch
- submitter sends the output to a dedicated mailing list like
  pulls@lists.linux.dev
- the bot auto-converts these requests into patch series and sends them to
  proper destinations

This is more cumbersome to implement, though, which is why I want to get it
done with GH first, as this gets us some immediate perks:

1. we get a fast, stable remote to pull from instead of potentially slow,
   broken remote that's intermittently working
2. we can offload all sanity checking to github instead of reimplementing them
   with our own CI
3. we end up doing a lot less state tracking for v1..v2..v3 with github

Once the GH implementation is working, I can adapt it to also support other
forges and pull requests sent to mailing lists.

> > - submitters would no longer need to navigate their way around
> >   git-format-patch, get_maintainer.pl, and git-send-email -- nor would need to
> >   have a patch-friendly outgoing mail gateway to properly contribute patches
> 
> Presumably, the bot would rely on get_maintainer.pl or it would get
> who to send to based on GH repo and reviewers? Without work on
> get_maintainer.pl, I don't think it will work well beyond simple
> cases.

The bot will actually rely on git-send-email, which can be configured to use
"tocmd" and "cccmd" to get the necessary info from get_maintainer.pl. E.g. in
my tests I have the following:

    tocmd = "$(git rev-parse --show-toplevel)/scripts/get_maintainer.pl --norolestats --nol"
    cccmd = "$(git rev-parse --show-toplevel)/scripts/get_maintainer.pl --norolestats --nom"

This does the right thing *most* of the time, and if it's not doing the right
thing, then it's the fault of get_maintainer.pl. :)

> > - subsystem maintainers can configure whatever CI pre-checks they want before
> >   the series is sent to them for review (and we can work on a library of
> >   Github actions, so nobody needs to reimplement checkpatch.pl multiple times)
> 
> What about all the patches that don't come from the GH PR? Those need
> CI pre-checks too. We're going to implement CI twice?

Most likely, yes, though we can certainly weigh how much we want to do on the
GH side. One thing I've thought about is letting bot inject a Tested-by: into
the patches it creates in order to reflect what's been already done, e.g.:

    Tested-by: GH Preflight Bot <ghbot@kernel.org>

There is indeed a lot of duplicated CI testing happening for Linux patches,
but it's a separate problem that I believe is being looked at by the Kernel CI
folks.

> The biggest issue I have on CI checks is applying patches. My algorithm is
> apply to my current base (last rc1 typically) or give up. I'm sure it could
> be a lot smarter trying several branches or looking at base-commit (not
> consistently used) or the git diff treeish hashes. What I'd really like is
> some bot or script that's applying series and publishing git branches with a
> messageid to git branch tool. 0-day is doing this now. Basically, the
> opposite direction as others have mentioned.

b4 will try to do this for you with -g, but it will only check against the
last 10 tags, as otherwise this takes a very long time, especially on series
that modify a lot of files. It can probably be a lot more intelligent about it
and work more like git bisect. I'll look into improving this feature.

> I think it needs to be per maintainer in terms of what checks run, but
> if submission is per maintainer project then the problem will be how
> does the submitter know where to send something? get_maintainer.pl
> tells them? It doesn't do a great job of that IMO. There's not a clear
> distinction of who applies my patch and others Cc'ed (file
> maintainers).

Yes, I'm leaning further towards having the submission point be a single
project per forge, and then just running some bare-minimum checks, similar to
what would be expected of the submitter using git-format-patch.

> I've kind of reached the conclusion that relying on submitters to get
> it right is never going to work (is Cc the DT list for DT patches so
> PW picks them up so hard!?). I think the model needs to be send
> patches to 'the kernel' and then maintainers have tools to extract all
> the patches they are interested in (the planned lore
> local-email-interface).

Yes! I'm hoping that we'll soon get to the point where "just send your patch
to linux-kernel@vger.kernel.org" becomes a reasonable thing to say again. E.g.
See this tread here:
https://public-inbox.org/meta/20210426164454.5zd5kgugfhfwfkpo@nitro.local/t/#u

However, I'm approaching this from multiple ends, so fixing up
get_maintainer.pl to return something reasonable also needs to happen imo.

-K
