Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C81C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 18:27:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6591C20873
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 18:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571164029;
	bh=N0VoC1KM8Zi3JuP+YcLw0F07+As5RmRvyP3TWdGdc20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WTksmKznP2+uaUzE1CZiohlNmmzwLxLSOyQF3b5FYRbZWtxKwDrNExZDA/KniX7N7
	 BHjfXrXF+U2u61Y6xagmTMVP41fafeKgyeX9ENj3yQLpsTJvmjTgJe4RVD20TMS2F9
	 tabKF/PAU16nlc+JbrnIXFA7csAEVcIg9jyCdvqg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbfJOS1J (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 14:27:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:44446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbfJOS1I (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 14:27:08 -0400
Received: from localhost (unknown [38.98.37.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3222120854;
        Tue, 15 Oct 2019 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571164028;
        bh=N0VoC1KM8Zi3JuP+YcLw0F07+As5RmRvyP3TWdGdc20=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eDzBRLQw3xQaRw4BTpic6VVOW3GkyR4VCQCuVzC9NXUTwtb/3Iu/DvoH0rG2Aw98x
         17395A9CgtOrxkGc1ccKwIO7Cml8UpPtJfpy9bwv9RMgoJMBtYvGF8dtl1uFK3LBOk
         c12sBjwuwOJKme+Qqn7kx3znZUe6QM1d+89xVEb0=
Date:   Tue, 15 Oct 2019 20:26:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     workflows@vger.kernel.org
Subject: Re: Emailing patchsets from the web on git.sr.ht
Message-ID: <20191015182642.GA1137327@kroah.com>
References: <BXPDQR3S0Z7D.3UY6YKF3KXSMX@homura>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BXPDQR3S0Z7D.3UY6YKF3KXSMX@homura>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 12:15:40PM -0400, Drew DeVault wrote:
> https://sr.ht/_fUk.webm
> 
> Future improvements will include closer linkage with mailing lists,
> suggested recipients, other stuff. Thoughts?

It looks nice!

Only thought I had was it seemed that the individual commit messages
were done twice?  Once when you did the commit and once when you sent
them out?  Or am I watching that wrong?

greg k-h
