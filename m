Return-Path: <SRS0=oU80=YW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FFACA9EAE
	for <workflows@archiver.kernel.org>; Tue, 29 Oct 2019 23:13:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68EEE2087E
	for <workflows@archiver.kernel.org>; Tue, 29 Oct 2019 23:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572390796;
	bh=AUgKj9TBf2Bn/sJeZx1VJqFEuIfae3I9SasJZ20Ieh8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-ID:From;
	b=n7So+i42DXLeg42Q0dGTyk/a4jrqR1kNCZ4maMH4YB4s3YORkXVxsdKsEDdfP+7/6
	 2FOnyYy6feS2ta6dTR1W8eq03a+92LqxAZ0LTwq+PRPvN+CWP+dFa6BTCDGKFeit4a
	 ZprqbcyjeCSIHHReLpWOQRtF+0Hr3I9DwaqHV9mw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfJ2XNQ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 29 Oct 2019 19:13:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:35966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbfJ2XNP (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 29 Oct 2019 19:13:15 -0400
Received: from localhost (unknown [69.71.4.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BBA7920862;
        Tue, 29 Oct 2019 23:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572390795;
        bh=AUgKj9TBf2Bn/sJeZx1VJqFEuIfae3I9SasJZ20Ieh8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=sm2w9IgH37QTwvc59RtS2bJuVjDhq4airwm8W4ukT0IDXr/1V52CNH1tANZRHw6Uv
         H8PsWu0UdE/IR8byf+Dw7L26vEz2l4ABowCFFyr/Q4kS7BmzsTK6I4mQYgBkNZe3fr
         uNlHQ/FJAAY/pVc+n4J9it7DhCicpswLnBYHYCWo=
Date:   Tue, 29 Oct 2019 18:13:13 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Eric Wong <e@80x24.org>
Cc:     Han-Wen Nienhuys <hanwen@google.com>, workflows@vger.kernel.org
Subject: Re: Lyon meeting notes
Message-ID: <20191029231313.GA124865@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029222629.GA19318@dcvr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 29, 2019 at 10:26:29PM +0000, Eric Wong wrote:
> > https://docs.google.com/document/d/1khLOBw5-HyaaNX7xregpHQLSfvGDUeHDY921bkI-_os/edit?usp=sharing
> 
> Thanks for taking notes.  Is there a version accessible to users
> without JavaScript?  Thanks.

Here it is:

Present:
* Konstantin Ryabitsev - technical director LF
* Google: Han-Wen Nienhuys, Dmitri Vyukov, David Gow, Brendan Higgins
* Christian Brauner - Canonical
* Shuah Khan - LF
* Greg KH
* Johan Holvold
* Kevin Hilman, KernelCI
* Veronika Kabatova - Red Hat/CKI CI
* Rafael Wysocki - intel
* Sasha Levin
* Frank Rowand
* Daniel Diaz - Linaro LKFT CI
* Daniel Vetter - intel
* Wolfram Sang
* Anasse Astier - freebox (?)


Consensus:
* Current situation is suboptimal/problematic
* CI folks
* Patchwork streamlines workflow; lot of activity now. Dormant for years, but now improving.
* Konstantin: patches: no attestation; no security. Easy to slip in vulns
* Linus checks sigs, but subsystem maintainers don’t.
* Konstantin: proposes minisign signatures.
* How realistic is this? (Steven).
* How big is the key? Ed25519 are short keys.
* Identity tracking? PGP giving up on key signing. TOFU.
* (unhearable)
* KR: signify/minisign background.
* PGP
* KR: Want it to be part of git.
* PGP signatures are attachments. Attachments are easily stripped from message.
* KR: want to archive history
* Complex patch doesn’t get in immediately, because patches need comment rounds, then spoofing gets exposed.
* Greg: base tree information will be great.
* Konstantin wants to put it into Git.
* Base tree
   * Discuss base commit
   * Hanwen: SHA1 is opaque too
   * KR: Linus complains that Changeid is equivalent to messageid, not so much opaqueness.
   * Hanwen: suggest to add a public URL to the base tree
   * Base goes into email; --base option git-format-patch.
   * Must become a requirement
   * Put into check-patch
   * Similar to signed-off
   * Not mandatory, andrew morton not using git. RFC patches also don’t need it.
* Gateways:
   * Point to tree, send from system
   * Inside corporations, HTTPS.
   * Adopt Gitgitgadget from github; creates mail patches from a GH repo.
   * Command line tool
   * Figuring out who to send this to.
   * Automation defeats attestation goal.
   * KR: should just build gitgitgadet for kernel.
* How to know whom to send patch to?
   * So much cruft in maintainers file.
* Interaction git-format-patch and config is tricky.
* Dmitrii Vyukov:
   * Can have a server to do this
   * KR: don’t want centralized infrastructure
   * Dmitrii: but gitgitgadget is the same?
* (14:35): feeds.
   * Human consumable information
   * Kernel.org can aggregate all the feeds, and can tell what CIs are still missing.
   * CI mail has logs, but the results are transient
   * Kernel.org can archive all these data.
   * Will be a lot of data, but want to start with feed.
   * Needs a common structured format to understand what all CI systems have done.
   * Attestation
   * Steven: could record the acks/reviewed-by.
* 2nd part of discussion: tooling.
   * Lore 200 Gb.
* [lost a lot of conversation here]
* Patchwork:
   * Has a web interface
   * Can run locally.
   * Inbox vs patchwork
   * Patchwork with approvals from different maintainers.
   * ...
   * KR: write local command to work with patchwork.
* KR: daniel uses gitlab, some people want to use gerrit
   * KR: wants to have a feed of data.
   * Mail from gerrit/gitlab, usually is noisy.
   * Tool can consume that feed.
   * Libc mailing list, still struggling
* Hanwen: Funding for tooling? Does Linux Foundation build the bridges, or do tool owners (gerrit, gitlab) have to do it?
   * Linux Foundation can go to companies to ask for funding
   * KR trying to get consensus so we can ask for resources & funding as a group.
   * Let people use tools, sourcehut, gitlab, gerrit
* KR: Lore.kernel.org:
   * Want to be able to search all over all data, gerrit, kernel etc. (like code search)
   * Find all the patches that touch XYZ
* Devs can miss reviews because people don’t know where reviews happen.
   * KR: have a bot that will respond on behalf if maintainer has no gerrit account.
   * KR: long time initiative: want to move to SSB.
