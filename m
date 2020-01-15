Return-Path: <SRS0=X7UR=3E=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FF0C33C9E
	for <workflows@archiver.kernel.org>; Wed, 15 Jan 2020 00:22:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5C0424658
	for <workflows@archiver.kernel.org>; Wed, 15 Jan 2020 00:22:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728795AbgAOAWt (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 14 Jan 2020 19:22:49 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:58066 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728774AbgAOAWt (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 14 Jan 2020 19:22:49 -0500
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id E9AB91F466;
        Wed, 15 Jan 2020 00:22:48 +0000 (UTC)
Date:   Wed, 15 Jan 2020 00:22:48 +0000
From:   Eric Wong <e@yhbt.net>
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc:     workflows@vger.kernel.org
Subject: TAN: SSIA emails [was: matrix.org as a replacement for IRC?]
Message-ID: <20200115002248.GA27608@dcvr>
References: <87d0bmkx1w.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87d0bmkx1w.fsf@linux.ibm.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
> Was there any discussion around using matrix.org or any other
> alternative as a replacement for IRC? This should help to avoid setting
> up irc proxy to keep track of discussion when the users are not online.

Going off on a tangent here, I've been thinking about detecting
and displaying Subject-Says-It-All (SSIA) emails in a more
concise way for public-inbox.

That would give some benefits of chat and save readers' time in
having less text to wade through; while still retaining
threading and offline capability of email.

I'm not aware of any existing MUAs which support, it, though;
so I'm hesitant to have public-inbox be the first...

> IIUC both KDE and mozilla switched to matrix as their IRC replacement.

Not sure how those orgs operate, but I find synchronous
communication tiring and difficult when people are operating
between several different timezones.  It's especially difficult
when several topics are being discussed in parallel.

I still use IRC privately, but only with small groups and mostly
for non-technical topics ("watercooler talk"); but some of my
fellow chatters have been wanting to move over to proprietary
replacements :<
