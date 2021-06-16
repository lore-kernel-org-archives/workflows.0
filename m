Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89658C48BE6
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 17:47:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7288C61209
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 17:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbhFPRtj (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 13:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbhFPRtj (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Jun 2021 13:49:39 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76828C061574
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 10:47:33 -0700 (PDT)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <johannes@sipsolutions.net>)
        id 1ltZdR-007hku-TE; Wed, 16 Jun 2021 19:47:29 +0200
Message-ID: <eecb639de83eb46f0ec52cc131e8ac2d4170b411.camel@sipsolutions.net>
Subject: Re: RFC: Github PR bot questions
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Date:   Wed, 16 Jun 2021 19:47:29 +0200
In-Reply-To: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 2021-06-16 at 13:18 -0400, Konstantin Ryabitsev wrote:
> 
> - the bot should (eventually) be clever enough to automatically track v1..vX
>   on pull request updates, assuming the API makes it straightforward


> - We can *probably* track when patch series get applied and auto-close pull
>   requests that are accepted -- but it's not going to be perfect (we'd
>   basically be using git-patch-id to match commits to pull requests). Or is it
>   better to auto-close the pull request right after it's sent to the list with
>   a message like "thank you, please monitor your email for the rest of the
>   process"? The latter is much easier for me, of course. :)

Those two conflict, no? I mean, if you close it, then there won't really
be a v2/vX?

Given that many (if not most) patch series require a v2 or more, it
would seem closing it immediately would be a bit confusing, and then
what do you even do to get a v2?

johannes

