Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B74C0015E
	for <workflows@archiver.kernel.org>; Wed, 12 Jul 2023 16:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbjGLQqb (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 12 Jul 2023 12:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232812AbjGLQqa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 12 Jul 2023 12:46:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A241BF6;
        Wed, 12 Jul 2023 09:46:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C129B6182E;
        Wed, 12 Jul 2023 16:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11343C433C9;
        Wed, 12 Jul 2023 16:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689180386;
        bh=3DcsHy/vVm9dqT3ZG5U0+zBbNJXD8ImEHN3tqEpv5IU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=b6WswjVFwR0Ts4ofWPfEoquBrzSDDZcu/eivbbPBYFNFvX5W3mYxUfUQLw+Aycyej
         bK5+uBPd19uwMHPZxOZ0KDYW+SBU0KinpIwntix7QFz4y/qZGv4PoyXiQiTyTUEtya
         NUtVKS4q4zlakNNpySs+HoudCrlpWaA2py4gIoRXM3+c4eSHkFhhBXIaKQPBcoMbHg
         dKfkovrCbpGLeUlFDDr9aEY6qnt95+9pWcCyzULYYUklBISuzUHF+Ukssb0cxdaP16
         PzmhYC2+yOJzMLFMBIMUPcgqhe69gQ2K1TiTQSSFXBv6XQodvEATEoF65T9OCq5Vo+
         GEhFTFXKnS15g==
Date:   Wed, 12 Jul 2023 09:46:25 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH docs] MAINTAINERS: treat Documentation/maintainer as
 process docs
Message-ID: <20230712094625.65144f11@kernel.org>
In-Reply-To: <87pm4x3xv3.fsf@meer.lwn.net>
References: <20230712161011.1339829-1-kuba@kernel.org>
        <20230712091154.7ad7561c@kernel.org>
        <87pm4x3xv3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 12 Jul 2023 10:20:32 -0600 Jonathan Corbet wrote:
> > Ugh, and looking at it in the email client I remember that m comes
> > before p. I'll send a v2 tomorrow if nobody nacks.  
> 
> See https://git.kernel.org/linus/c192ac735768 :)

Oops, it would have been pretty sad if the sorting survived only 
3 days :)  Also I didn't realize there's a preferred (non-alphabetical)
order of keywords!
