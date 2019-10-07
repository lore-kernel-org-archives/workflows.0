Return-Path: <SRS0=J16y=YA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13592C47404
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 16:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1166206C0
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 16:20:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbfJGQUG (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 12:20:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43568 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727801AbfJGQUG (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 7 Oct 2019 12:20:06 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 25E2430860BD;
        Mon,  7 Oct 2019 16:20:03 +0000 (UTC)
Received: from hmswarspite.think-freely.org (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8983A600C1;
        Mon,  7 Oct 2019 16:20:02 +0000 (UTC)
Date:   Mon, 7 Oct 2019 12:20:00 -0400
From:   Neil Horman <nhorman@redhat.com>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     David Miller <davem@davemloft.net>, nhorman@tuxdriver.com,
        workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191007162000.GC15431@hmswarspite.think-freely.org>
References: <20191007.173329.2182256975398971437.davem@davemloft.net>
 <BXJEICGE1NYW.39KN61VRNGXPL@homura>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BXJEICGE1NYW.39KN61VRNGXPL@homura>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 07 Oct 2019 16:20:06 +0000 (UTC)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 07, 2019 at 11:35:43AM -0400, Drew DeVault wrote:
> There's no substance here to back up your arguments. You just say email
> is dying and hope we take it for granted that you're right. Email is
> _not_ terrible, and there are serious flaws with any of the proposed
> alternatives to it.

To offer some clarification here, no email isn't unilaterally terrible, its a pretty
handy interface for any user conducting a single in depth conversation
around a specific topic

For someone on the other hand, thats got to manage those conversations,
writ large (on the order of several hundred a day), where management
entails extracting structured text (that as often as not, is not as
structured as it should be), and applying that data to a git tree, its a
huge drain on that persons time.  Between that and dealing with general
maintenence tasks (other email servers that stop responding, or spam the
list, etc), and it becomes a full time job just to keep the system
running before any real work gets done

Neil

