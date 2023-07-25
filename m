Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77566EB64DD
	for <workflows@archiver.kernel.org>; Tue, 25 Jul 2023 01:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjGYBEc (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 24 Jul 2023 21:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjGYBEc (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 24 Jul 2023 21:04:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B07CE53;
        Mon, 24 Jul 2023 18:04:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B542861173;
        Tue, 25 Jul 2023 01:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4690C433C8;
        Tue, 25 Jul 2023 01:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690247069;
        bh=k0+Q7F/uZHsflIOAaWgAaLqYda6TVmmp+S/0I3sWSCo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P+DUYEJ5KB6/L2c/yXGBpkbsWb3OmbEqyvdR8CQn8TMmASqIHzg548JtS63kSE80P
         lCOaF6qjmq9gSCwO5nOhQkGO1IjwyvU2Ku6oEDwzYUsnmaTkXUZM9KP1cKtD/yE9hZ
         2KEaQRm9N9Tk0XqdQPIe2xsdEDsc0UksZ74xK2E8U7uLYuQTeKSooMN2OjzuuZNF/Y
         niPhk5Uky7RvT5sy2BiQ5fO5slG5AhcYn7tEAARX9JUiI8dPiOiGEwJA14VqDZThHN
         jrYTPqQuzHfcofbP8hZDk9GNXPeHpXqOZ9+mD0H8lM3z4XIPuDHz8/nUw0jXsAu/KM
         h6Xmcybjye22g==
Date:   Mon, 24 Jul 2023 18:04:28 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Joe Perches <joe@perches.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        workflows@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Enable Designware XGMAC VLAN Stripping Feature 1/2]
 dt-bindings: net: snps,dwmac: Add description for rx-vlan-offload
Message-ID: <20230724180428.783866cc@kernel.org>
In-Reply-To: <c690776ce6fd247c2b2aeb805744d5779b6293ab.camel@perches.com>
References: <20230721062617.9810-1-boon.khai.ng@intel.com>
        <20230721062617.9810-2-boon.khai.ng@intel.com>
        <e552cea3-abbb-93e3-4167-aebe979aac6b@kernel.org>
        <DM8PR11MB5751EAB220E28AECF6153522C13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
        <8e2f9c5f-6249-4325-58b2-a14549eb105d@kernel.org>
        <20230721185557.199fb5b8@kernel.org>
        <c690776ce6fd247c2b2aeb805744d5779b6293ab.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

[clean up the CC list]

On Fri, 21 Jul 2023 20:32:44 -0700 Joe Perches wrote:
> On Fri, 2023-07-21 at 18:55 -0700, Jakub Kicinski wrote:
> > On Fri, 21 Jul 2023 18:21:32 +0200 Krzysztof Kozlowski wrote:  
> > > That's not how you run it. get_maintainers.pl should be run on patches
> > > or on all files, not just some selection.  
> > 
> > Adding Joe for visibility (I proposed to print a warning when people 
> > do this and IIRC he wasn't on board).  
> 
> What's the issue here?  Other than _how_ the script was used,
> I don't see an actual problem with the script itself.

I just CCed you on another case. If people keep using get_maintainers
wrong, it *is* an issue with the script.

> I use the scripts below to send patch series where a patch series
> are the only files in individual directories.

The fact that most people end up wrapping get_maintainers in another
script is also a pretty strong indication that the user experience is
inadequate.

To be clear - I'm happy to put in the work to make the changes.
It's just that from past experience you seem to have strong opinions
which run counter to maintainers' needs, and I don't really enjoy
writing Perl for the sake of it.
