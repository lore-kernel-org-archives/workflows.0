Return-Path: <SRS0=vuSN=4P=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAAAC4BA35
	for <workflows@archiver.kernel.org>; Thu, 27 Feb 2020 01:32:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B91624679
	for <workflows@archiver.kernel.org>; Thu, 27 Feb 2020 01:32:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgB0BcT (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Feb 2020 20:32:19 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:42068 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728091AbgB0BcS (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 26 Feb 2020 20:32:18 -0500
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id A26F91F619;
        Thu, 27 Feb 2020 01:32:18 +0000 (UTC)
Date:   Thu, 27 Feb 2020 01:32:18 +0000
From:   Eric Wong <e@80x24.org>
To:     libreplanet-dev@libreplanet.org
Cc:     workflows@vger.kernel.org
Subject: wish: forge with IMAP + SMTP + webmail support
Message-ID: <20200227013218.GA32098@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

(workflows@vger subscribers: this is about the new FSF forge:
 <https://www.fsf.org/blogs/sysadmin/coming-soon-a-new-site-for-fully-free-collaboration>)

Hey all, I'm partial to using email for software contributions,
but I understand some users are used to forges.  So it would be
great if forges could interoperate with each other via email.

Users who don't have forge accounts could still submit to
the forge using email, and users may use their forge account
to submit patches to email-only projects or external forges.

Forges would in effect become email+identity providers similar
to fastmail, gmail, etc. but with developer-centric features.

The way I see it: existing forges are web forums (like phpBB)
optimized for software development.  I think there's room for
email providers being optimized for software development.

Why email and not ActivityPub or some other transport?  Existing
tools and user base.  Getting existing tools to support AP would
be a timesink for developers, especially when "git <am|send-email>"
are already abundant and widely-installed because of git.  Not to
mention the burden of having users to upgrade/install to newer
versions if they need AP support.

Avoid standards proliferation, please.

I'm probably not the right person to hack on forge stuff (<form>
elements and fancy web design scare me :x).  dovecot+nginx is
pretty scalable at this point and could be used.

Down the line, maybe public-inbox (what I spend most of my free
time on) could eventually provide more scalable IMAP/POP3
support using its storage and search backend.

Thanks for reading.
