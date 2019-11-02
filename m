Return-Path: <SRS0=Umn/=Y2=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43967CA9EC7
	for <workflows@archiver.kernel.org>; Sat,  2 Nov 2019 11:52:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CD2C20862
	for <workflows@archiver.kernel.org>; Sat,  2 Nov 2019 11:52:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfKBLwh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 2 Nov 2019 07:52:37 -0400
Received: from smtprelay0194.hostedemail.com ([216.40.44.194]:41810 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726163AbfKBLwh (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 2 Nov 2019 07:52:37 -0400
X-Greylist: delayed 342 seconds by postgrey-1.27 at vger.kernel.org; Sat, 02 Nov 2019 07:52:36 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 9EF0E18028999
        for <workflows@vger.kernel.org>; Sat,  2 Nov 2019 11:46:54 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id B25E5100E7B43;
        Sat,  2 Nov 2019 11:46:53 +0000 (UTC)
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-HE-Tag: clock92_1ef4a9c78de48
X-Filterd-Recvd-Size: 2174
Received: from grimm.local.home (vin.openfest.org [185.117.82.237])
        (Authenticated sender: rostedt@goodmis.org)
        by omf09.hostedemail.com (Postfix) with ESMTPA;
        Sat,  2 Nov 2019 11:46:52 +0000 (UTC)
Date:   Sat, 2 Nov 2019 07:46:47 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Daniel Axtens <dja@axtens.net>,
        Han-Wen Nienhuys <hanwen@google.com>, workflows@vger.kernel.org
Subject: Re: Lyon meeting notes
Message-ID: <20191102074647.404a6554@grimm.local.home>
In-Reply-To: <20191101172910.x7neoilwaotj5njb@pure.paranoia.local>
References: <CAFQ2z_PiNzDeBT7mnprRdk2kf==HoBU1HM7NT4hgFns1wt4WVg@mail.gmail.com>
        <87wocnmb8j.fsf@dja-thinkpad.axtens.net>
        <20191101172910.x7neoilwaotj5njb@pure.paranoia.local>
X-Mailer: Claws Mail 3.17.4git49 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, 1 Nov 2019 13:29:10 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> For the lack of a better term, I'm calling it "local patchwork", though
> it's more likely to be a closely related spin-off that would hopefully
> share a lot of code with patchwork and be able to both benefit from
> upstream and to commit code back up for any shared functionality.

I know this was one of the "not within 6 months" parts, but I don't
want this to be lost.

One of the issues with a 'local patchwork' that was brought up is if
you have multiple maintainers of a single subsystem. How one maintainer
might say "accept" and another might say "reject", if one was doing
this offline, and uploaded to the central system, it could conflict
with the changes there.

What I suggested was, for multi maintainer systems, to allow for
individual accounts. Where a "accept" of a patch would require an
accept from all the given maintainers. Kind of like a hierarchy. This
way, even if you are offline, you can upload your own "accept" and it
wont affect the "reject" from the other maintainer. But you would be
able to see everyone's judgment of a patch when you get back online.

-- Steve
