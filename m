Return-Path: <SRS0=aQmP=3O=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED021C2D0DB
	for <workflows@archiver.kernel.org>; Sat, 25 Jan 2020 20:50:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA32B2071A
	for <workflows@archiver.kernel.org>; Sat, 25 Jan 2020 20:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgAYUul (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 25 Jan 2020 15:50:41 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:45264 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727278AbgAYUul (ORCPT <rfc822;workflows@vger.kernel.org>);
        Sat, 25 Jan 2020 15:50:41 -0500
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id CE4A41F4B9;
        Sat, 25 Jan 2020 20:50:40 +0000 (UTC)
Date:   Sat, 25 Jan 2020 20:50:40 +0000
From:   Eric Wong <e@80x24.org>
To:     workflows@vger.kernel.org
Subject: patch submission auth via OpenID/OAuth?
Message-ID: <20200125205040.GA15397@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Along the lines using Patchwork to submit patches[1] would a
standalone web UI to relay git-generated emails using federated
identity from OpenID or OpenID Connect/OAuth providers be
something that could attract new users?

I've only implemented and used OpenID over a decade ago,
and the newer standards seem more complicated :<
However, OAuth2 seems widely adopted.  But I don't do the
social media thing at all, so I've never used it.

[1] https://lore.kernel.org/workflows/20191010144150.hqiosvwolm3lmzp5@chatter.i7.local/
