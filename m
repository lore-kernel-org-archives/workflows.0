Return-Path: <SRS0=J16y=YA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CA1ECE58C
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 16:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77A3C20673
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 16:24:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="fNMO83/H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbfJGQYt (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 12:24:49 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:50994 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728229AbfJGQYs (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 7 Oct 2019 12:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1570465488; bh=r2vOkChIbHbwyuDjo7+ANVrhm91SjwcYCGwb4RnHHBU=;
        h=In-Reply-To:Date:Cc:Subject:From:To;
        b=fNMO83/HpwBGXLFyYP0pk30bU5cWzTV1hbBSMZkSa4Tx2Ez59D5aWQbsS+e6CYQ8S
         RM0wRXnkyz2pybnkOQX/FMalEoqnyZ3VveEjzRSSIp+ysBGOaoMwFdoKs2k7QfZzC/
         8QZxDW+h0UgppZyKG5tn7Muvx3JCiatkdidkB9cU=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20191007162000.GC15431@hmswarspite.think-freely.org>
Date:   Mon, 07 Oct 2019 12:24:47 -0400
Cc:     "David Miller" <davem@davemloft.net>, <nhorman@tuxdriver.com>,
        <workflows@vger.kernel.org>
Subject: Re: thoughts on a Merge Request based development workflow
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Neil Horman" <nhorman@redhat.com>
Message-Id: <BXJFJX89OZEV.17YCLI5G860LW@homura>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon Oct 7, 2019 at 12:20 PM Neil Horman wrote:
> For someone on the other hand, thats got to manage those conversations,
> writ large (on the order of several hundred a day), where management
> entails extracting structured text (that as often as not, is not as
> structured as it should be), and applying that data to a git tree, its a
> huge drain on that persons time.  Between that and dealing with general
> maintenence tasks (other email servers that stop responding, or spam the
> list, etc), and it becomes a full time job just to keep the system
> running before any real work gets done

I'm one of these people. My mail system's volume is on the order of
10,000 emails processed per month, forwarded to ~3,000 subscriptions. I
hardly ever have to touch it. The main issue is that many mail systems
are ancient and overcomplex, but nothing is stopping anyone from working
with simpler and more modern mail systems. And if we're going to be
investing development time in improvements, things will get even better
very quickly.
