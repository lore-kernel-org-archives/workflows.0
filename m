Return-Path: <SRS0=lZea=XT=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B89FC432C1
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 23:15:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB7EC207FD
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 23:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kWk60ztQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411126AbfIXXPU (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 24 Sep 2019 19:15:20 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:44026 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411113AbfIXXPU (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 24 Sep 2019 19:15:20 -0400
Received: by mail-pf1-f177.google.com with SMTP id a2so2199158pfo.10
        for <workflows@vger.kernel.org>; Tue, 24 Sep 2019 16:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=YYkefAN+BRnfZydB/iwX96LkzAwlI71DrmRI9tq8Nc8=;
        b=kWk60ztQMOwTA6mgZS2wp51Cy/twGTckEhsP1/BNtCKLBnMgSGc0IKozXyXjnKFYEJ
         2Yk3K/kQqpDayzIgi8CAmIVoI2EE0FjMhEGHALxVHC5q7ngK93ifWABopT4gNNqiTLiP
         tFUTGO7JNmCS3Jqmvt/rpOxLpxZdYWQVB8SBXpA6VCO4cyAzbkWKSmrt2wO36riFEkzp
         tRXPScDCaQIJ9Af8H0ZNef4T298KJ6dXmbQHlfAgR+9kuF5ByoBx4SijwK9cf0H59O/w
         4FZsARrfYjHrfSogiA2etngrlbqY/qO3C6T8ZjOTi/dGTeK7M3SFFvitj3FIpaz0hgU9
         HK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=YYkefAN+BRnfZydB/iwX96LkzAwlI71DrmRI9tq8Nc8=;
        b=JXvb6mpVwOT8AHDkJBL8X4gpvhmNWA/0187o37jF18U3oMITYnWmxRBLJCTshOdRRN
         AW/G2fZ4xYrjwZdRvFKryoei0HfXnSkpSwdlj6ZzEs6nAo2z+q3XTNcHnSvThCBXxf87
         yi+NlpuE0yugMYBndDU4bM2MkLRAuCs+kHg0E5xQwxZG2Xl6x049GzLjiLHbg5VRvsaM
         SiG3+cHbov9D3lhP9C6hGWDqucecNgPa2MwLLTPwK8j9dO4PS8gGqnpZ914vwhxFVjQG
         HEfxmTWwL7A5VFO6O+hbLdMh8Iktmbrjw07sSd8biQD5kMXqlov9BYeFqg2+J0FsjvRu
         5o5w==
X-Gm-Message-State: APjAAAU8HoVEMeWK4nbAGXmNtDhKqYZ6gcHrSZ1yanFGoJbgq7kz1APa
        V8NZ7/o098Rn7dW970Iebnfr8w==
X-Google-Smtp-Source: APXvYqzWDeNX3l6+UJ1G/flcHSSihl285rVCwrMVpoCNjAM5iK6nT1TXm64bfK5bkLOw5IdkU1vqwg==
X-Received: by 2002:a17:90a:ad8f:: with SMTP id s15mr2846523pjq.50.1569366919239;
        Tue, 24 Sep 2019 16:15:19 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id x68sm5373548pfd.183.2019.09.24.16.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 16:15:18 -0700 (PDT)
Date:   Tue, 24 Sep 2019 16:15:18 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Neil Horman <nhorman@tuxdriver.com>
cc:     workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
In-Reply-To: <20190924182536.GC6041@hmswarspite.think-freely.org>
Message-ID: <alpine.DEB.2.21.1909241609540.78294@chino.kir.corp.google.com>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 24 Sep 2019, Neil Horman wrote:

> Hey all-
> 	After hearing at LPC that that there was a group investigating moving
> some upstream development to a less email-centric workfow, I wanted to share
> this with the group:
> 
> https://gitlab.com/nhorman/git-lab-porcelain
> 
> Its still very rough, and is focused on working with RH based workflows
> currently, but it can pretty easily be adapted to generic projects, if theres
> interest, as well as to other services besides gitlab (github/etc).
> 
> The principle is pretty straightforward (at least currently), its a git
> porcelain that wraps up the notion of creating a merge request with sending
> patch emails.  It uses the gitlab rest api to fork projects, and manipulate MR's
> in sync with email patch posting.  It also contains an email listener daemon to
> monitor reqisite lists for ACK/NACK responses which can then be translated into
> MR metadata for true MR approvals/notifications to the maintainer that a branch
> is good to merge.
> 
> Ostensibly, if this has any sort of legs, the idea in the long term is to add
> the ability to use the porcelain to do reviews on the command line, and
> eventually phase out email entirely, but I think thats a significant way off
> here.
> 
> Anywho, food for thought.
> 

This is very interesting.

It may be off-topic but this email raised my curiosity about how features 
are maintained internally before they are ready to propose to upstream, 
especially when those features are developed over multiple upstream base 
releases.

We have features that we maintain in-house until they are ready to push 
upstream and while they are still under active development or we are 
collecting data to use as motivation for asking that feature to be merged.

For this, we have historically always rebased these features on top of new 
kernel releases (unfortunately not 4.20 -> 5.0 -> 5.1, but somewhere in 
between like 4.20 -> 5.2) and that creates a lot of churn, developer 
resources, and rewrites the git history.

Exploring options for maintaining these features by merging rather than 
rebasing has been done: instead of rebasing from 4.20 to 5.2, for example, 
as a clean series on top of 5.2, we fork the feature branch based on 4.20 
off and merge it with 5.2, fix it up, run tests, and publish.  The thought 
process here was that we can always git rebase --onto linus to create a 
nice clean patch series for posting upstream or asking for a git pull from 
upstream.

I'd be very interested to know how others maintain patch series across 
multiple base kernel version especially when they need to maintain the 
feature for those kernel versions separately, how RH handles their patches 
before they are ready to be officially posted, etc.
