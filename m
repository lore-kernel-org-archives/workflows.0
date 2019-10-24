Return-Path: <SRS0=kvgU=YR=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B792CA9EAF
	for <workflows@archiver.kernel.org>; Thu, 24 Oct 2019 13:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6729C2166E
	for <workflows@archiver.kernel.org>; Thu, 24 Oct 2019 13:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390679AbfJXN6n (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 24 Oct 2019 09:58:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:39280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390960AbfJXN6m (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 24 Oct 2019 09:58:42 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9AFD621655;
        Thu, 24 Oct 2019 13:58:41 +0000 (UTC)
Date:   Thu, 24 Oct 2019 09:58:39 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191024095839.44429eeb@gandalf.local.home>
In-Reply-To: <CACT4Y+am=FxEkMYFz8JZXP8GUOEzOPF=6h_s_04HbozU6BJkVQ@mail.gmail.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
        <20191011085702.GB1075470@kroah.com>
        <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
        <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
        <20191014205658.GG5564@mit.edu>
        <20191015083741.1d0731e5@gandalf.local.home>
        <20191015163704.GJ4875@pendragon.ideasonboard.com>
        <20191015124749.1a11926f@gandalf.local.home>
        <20191021153918.GE4947@pendragon.ideasonboard.com>
        <20191024091541.10af3417@gandalf.local.home>
        <CACT4Y+am=FxEkMYFz8JZXP8GUOEzOPF=6h_s_04HbozU6BJkVQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 24 Oct 2019 15:33:04 +0200
Dmitry Vyukov <dvyukov@google.com> wrote:

> On Thu, Oct 24, 2019 at 3:15 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Mon, 21 Oct 2019 18:39:18 +0300
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:


> 
> Purely theoretically let's consider that the changes do not improve
> _your_ efficiency, but they significantly improve overall project
> efficiency by positively affecting people who did not develop a
> workflow over the past decades (maybe there were not around 2 decades
> ago) and positively affecting various tooling that _you_ may be
> directly interested in, but otherwise they are important for the
> project overall. So for you it's no change in efficiency except that
> you now need to do things differently. What do you think about such
> changes? Are you ready to force yourself? :)
> I think it's quite cornerstone question here. All (?) major figures in
> the kernel (who are ~~98% of decision making, but ~~2% of kernel
> developers overall) have developed workflows over the past decades
> that work reasonably well for them. If they veto all proposed changes
> based on the criteria you described, every new contributor will need
> decades to develop own workflows to become an efficient contributor
> and lots of tooling will be painfully hard to do.
>

The above sound like a one size fits all approach, which I would caste
a veto to. I would like a solution that works for multiple workflows.
One where mine and others still work too.

Please, lets work on a infrastructure that is robust and flexible, that
is split into back and front ends. That way, we have a single "back
end" and multiple front ends that suite everyone's needs.

-- Steve
