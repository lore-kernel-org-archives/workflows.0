Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC1AC48BE5
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 21:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0E48613E2
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 21:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234009AbhFPVUe (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 17:20:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:45342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234004AbhFPVUd (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 16 Jun 2021 17:20:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19830613E4;
        Wed, 16 Jun 2021 21:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623878307;
        bh=4nTpgdn1KPA8CCpNloJWWW7Cuh/nDQUmA53iPHNwJ3Q=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=RVZcDy7Eq5Ktq8VGY6lwhIAajSDAcrel706vP0Ng+Wte+01JBHsoYT5ZeF7gdUFgt
         3WBpRopdc5oKnNSCFZIvYOXAVaQoyaZj/5cW3xEK+a8cNR0APwQinPS1HdAQQszlq2
         YQzjVxn3VFXHDesFLWwMSnDdHP8bFRhijp4HzGW94iLwMpJfARitGyfQINnWrI/nyt
         kMWmIPB5m/o139DAPshAdFKEiS+2FQlFkRjsgXGzbFUvQYVHQyAsuJ8bY5FscmP8/l
         u3q3aSBCDn/usd2ETbAFvup99MxJ8nKSYl3e3JhV4D74TWHxmfXnKUHvLHSn+DoVpo
         DWQGIIr4OCb+g==
Date:   Wed, 16 Jun 2021 14:18:25 -0700 (PDT)
From:   Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To:     Rob Herring <robh@kernel.org>
cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
In-Reply-To: <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2106161416020.24906@sstabellini-ThinkPad-T480s>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 16 Jun 2021, Rob Herring wrote:
> > - subsystem maintainers can configure whatever CI pre-checks they want before
> >   the series is sent to them for review (and we can work on a library of
> >   Github actions, so nobody needs to reimplement checkpatch.pl multiple times)
> 
> What about all the patches that don't come from the GH PR? Those need
> CI pre-checks too. We're going to implement CI twice? The biggest
> issue I have on CI checks is applying patches. My algorithm is apply
> to my current base (last rc1 typically) or give up. I'm sure it could
> be a lot smarter trying several branches or looking at base-commit
> (not consistently used) or the git diff treeish hashes. What I'd
> really like is some bot or script that's applying series and
> publishing git branches with a messageid to git branch tool. 0-day is
> doing this now. Basically, the opposite direction as others have
> mentioned.

It exists: it is called patchew and we are using it in QEMU and in Xen
Project (https://gitlab.com/xen-project/patchew).

It takes patch series off of a mailing list and commits them to a branch
to trigger a CI-loop run. It is also able to send back a "passed" or
"failed" email to the mailing list. It is great!
