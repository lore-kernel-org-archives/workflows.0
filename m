Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF59EC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 17:07:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1E26613AA
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 17:07:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhFQRKF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 13:10:05 -0400
Received: from mail.hallyn.com ([178.63.66.53]:46566 "EHLO mail.hallyn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230028AbhFQRKF (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 13:10:05 -0400
Received: by mail.hallyn.com (Postfix, from userid 1001)
        id 175F8A92; Thu, 17 Jun 2021 12:07:56 -0500 (CDT)
Date:   Thu, 17 Jun 2021 12:07:56 -0500
From:   "Serge E. Hallyn" <serge@hallyn.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210617170756.GA27599@mail.hallyn.com>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <eecb639de83eb46f0ec52cc131e8ac2d4170b411.camel@sipsolutions.net>
 <20210616175506.pzds7shhwyec3imb@nitro.local>
 <CANiq72k0_P8vxMwUT154oBRPevRKbz7-34zQ-toPjMfhAKUzrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72k0_P8vxMwUT154oBRPevRKbz7-34zQ-toPjMfhAKUzrg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 08:13:55PM +0200, Miguel Ojeda wrote:
> On Wed, Jun 16, 2021 at 7:55 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > Unless I'm misreading the docs, the submitter should be able to reopen the
> > closed pull request, so it's not a permanent action. This may actually make it
> > easier to track things for v1/v2, since we wouldn't need to continuously poll
> > open pull requests to see if any of them changed.
> 
> For versioning, what I request at the moment is that people force-push
> their PR, overwriting the previous set of commits, rather than sending
> a new PR. Then people write in the GitHub-PR-message (which we use as
> the cover letter) the diff/updates, if any. The bot detects changes
> and pushes a new review every time, and hides its own past messages
> (i.e. for previous versions).

In Jenkins that gives you /1 /2 /3 etc versions, but IIRC doesn't doing
this in github lead to lost commits?
