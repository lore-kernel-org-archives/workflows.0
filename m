Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4527C2BB3F
	for <workflows@archiver.kernel.org>; Sat, 18 Nov 2023 19:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjKRTJ6 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 18 Nov 2023 14:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjKRTJ6 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 18 Nov 2023 14:09:58 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C41B12B;
        Sat, 18 Nov 2023 11:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=4YXEMkjy6qzjXjqNunS2BG4X7joch/6NstMnutQ4tTI=; b=6MJRHvnKI6gcE4KK+3VzO2OOr6
        noiOey5mh36Ol7hsJBmnY5tLbSGuZMK7N1X8EI95EXOrUL/Ss7crkyMm97zQUPYJ8sPdL60Jy6sRC
        VVp+7vh+3AdRNWX8HsP9pyszii3+I/d5z3GvaQBFQAcal7UdIAY9tKRJmiazVW9Xg30A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1r4QhL-000Wbp-8F; Sat, 18 Nov 2023 20:09:43 +0100
Date:   Sat, 18 Nov 2023 20:09:43 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net] docs: netdev: try to guide people on dealing with
 silence
Message-ID: <dd172cac-f530-4874-a4e7-fc8d7676d708@lunn.ch>
References: <20231118172412.202605-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118172412.202605-1-kuba@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

> +On the other hand, due to the volume of development discussions on netdev
> +are very unlikely to be reignited after a week of silence.

My English parse falls over on 'are', and wants to backtrack and try
alternatives.

Maybe:

On the other hand, due to the volume of development discussions on
netdev, after a week of silence further discussions are very unlikely
to occur without prompting.

	Andrew
