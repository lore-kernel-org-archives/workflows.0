Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0761AC2BB3F
	for <workflows@archiver.kernel.org>; Wed, 15 Nov 2023 18:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbjKOSW1 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 15 Nov 2023 13:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232620AbjKOSW1 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 15 Nov 2023 13:22:27 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5EE1B8;
        Wed, 15 Nov 2023 10:22:22 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B270C433C7;
        Wed, 15 Nov 2023 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1700072542;
        bh=ngoCt74/fsP8pS/ee3EIPN/IBdECAl6jorYcfguYxbg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WZyJJSSmwHY1Y4g7cygzvfBg1/Ia5H9twSL9W3BxttcE6i3R6+Y/NkikTVSK8aEVZ
         L9c61dxyM0mSoCzwIyoKY+oXFtL2wWQEPLRabEJFcUr5Wlxf7eiEZ/m0M+k/vywWYP
         vClpnNejFLP4Qs6q6LtRlKoAyx9rhNG9+XE7gkGI=
Date:   Wed, 15 Nov 2023 13:22:21 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@alien8.de>,
        Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: submitting-patches: improve the base commit
 explanation
Message-ID: <20231115-resourceful-dashing-collie-63b8ff@nitro>
References: <20231115170330.16626-1-bp@alien8.de>
 <202311150948.F6E39AD@keescook>
 <20231115175632.GA29486@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231115175632.GA29486@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Nov 15, 2023 at 07:56:32PM +0200, Laurent Pinchart wrote:
> When the base of a series is in Linus' tree, or in the corresponding
> subsystem maintainer's tree, things are easy, but there are many
> situations where the base is a merge of multiple branches (perhaps a
> for-next and a fixes branch for instance), or where prerequisites have
> been applied manually for one reason or another. This can and should of
> course be described in the cover letter, and the submitter should push
> and provide a link to a branch that contains the series on top of the
> appropriate base (or just a link to the base). This won't help the bots
> much though, if they just look at the base tag. Is there a way, or can
> we standardize on a way, to indicate where the base can be found ?

Yes, I suggest we use:

base-repository: <some-canonical-repo-url>

So, a b4-submitted series will have these footers:

change-id: <unique-series-id>
base-commit: <commit-id-or-tag>
base-repository: <canonical-repo-url>

(And then, eventually, there will be series dependency info in the format:

requires: <unique-series-id>:<version>

-K
