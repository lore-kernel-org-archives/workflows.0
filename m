Return-Path: <SRS0=qG9y=XH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7614CC4CEC5
	for <workflows@archiver.kernel.org>; Thu, 12 Sep 2019 15:03:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53BE62081B
	for <workflows@archiver.kernel.org>; Thu, 12 Sep 2019 15:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732845AbfILPDB (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 12 Sep 2019 11:03:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:34922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732799AbfILPDA (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 12 Sep 2019 11:03:00 -0400
Received: from oasis.local.home (unknown [148.69.85.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D488F2081B
        for <workflows@vger.kernel.org>; Thu, 12 Sep 2019 15:02:55 +0000 (UTC)
Date:   Thu, 12 Sep 2019 11:02:30 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     "workflows@vger.kernel.org" <workflows@vger.kernel.org>
Subject: Notification of your branch being tested by zero day bot?
Message-ID: <20190912110230.483152ed@oasis.local.home>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Would it be possible to have an opt-in for the zero day bot to send an
email when a branch is being tested? Similar to the "SUCCESS" opt-in
email.

That is, it would be nice to see an email that lets you know that a
branch you pushed to kernel.org is being tested. Currently there's a
bit of limbo when a push happens, and you need to wait, perhaps several
days, to see a result. In the mean time you have no idea if there's any
progress going on. A notification would be nice.

-- Steve
