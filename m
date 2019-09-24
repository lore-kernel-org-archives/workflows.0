Return-Path: <SRS0=lZea=XT=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60594C432C1
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 18:37:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE62C214DA
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 18:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="siOfhE6l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436908AbfIXSh3 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 24 Sep 2019 14:37:29 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:39904 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392031AbfIXSh3 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 24 Sep 2019 14:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1569350249; bh=xt52Sl/sfHYAentq+gX8JAxz7PPrBlHIrJtnWZNng4c=;
        h=In-Reply-To:Date:Subject:From:To;
        b=siOfhE6lMBTYatLU6HM92YUGPjaU8Ho5zFCKM7V+lm/8+M/3Yyf9i7eQeCQ1TYJ5b
         3FMPxgmGuFA2oF9Xk9fc/lZjTHU50trvi+TjNa1N/MVgi3FAbIWAGD7Ojls7wKdXz/
         0MSND3wvLUG/FftNQ/JSjJdoZj2XaZCPsqihm0tM=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20190924182536.GC6041@hmswarspite.think-freely.org>
Date:   Tue, 24 Sep 2019 14:37:28 -0400
Subject: Re: thoughts on a Merge Request based development workflow
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Neil Horman" <nhorman@tuxdriver.com>, <workflows@vger.kernel.org>
Message-Id: <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue Sep 24, 2019 at 2:25 PM Neil Horman wrote:
> 	After hearing at LPC that that there was a group investigating moving
> some upstream development to a less email-centric workfow, I wanted to sh=
are
> this with the group:
>=20
> https://gitlab.com/nhorman/git-lab-porcelain
>=20
> Its still very rough, and is focused on working with RH based workflows
> currently, but it can pretty easily be adapted to generic projects, if th=
eres
> interest, as well as to other services besides gitlab (github/etc).
>=20
> The principle is pretty straightforward (at least currently), its a git
> porcelain that wraps up the notion of creating a merge request with sendi=
ng
> patch emails.  It uses the gitlab rest api to fork projects, and manipula=
te MR's
> in sync with email patch posting.  It also contains an email listener dae=
mon to
> monitor reqisite lists for ACK/NACK responses which can then be translate=
d into
> MR metadata for true MR approvals/notifications to the maintainer that a =
branch
> is good to merge.

This is a great idea.

> Ostensibly, if this has any sort of legs, the idea in the long term is to=
 add
> the ability to use the porcelain to do reviews on the command line, and
> eventually phase out email entirely, but I think thats a significant way =
off
> here.

Until this part. Phasing out email in favor of a centralized solution
like Gitlab would be a stark regression.
