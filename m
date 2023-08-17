Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9595CC64E96
	for <workflows@archiver.kernel.org>; Thu, 17 Aug 2023 20:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354996AbjHQUsD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Aug 2023 16:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355006AbjHQUrg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Aug 2023 16:47:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197DF2698
        for <workflows@vger.kernel.org>; Thu, 17 Aug 2023 13:47:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AB52C6135D
        for <workflows@vger.kernel.org>; Thu, 17 Aug 2023 20:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47A2C433C8;
        Thu, 17 Aug 2023 20:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1692305254;
        bh=PBe6nxuGY7kS4b2kcm7CTHG47fel3k/Zzwfncca2DfI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qj6K4XRnOv+/4ElYTYyErBCCsqsBIMwgfuyllEw7AtLXrS0+K2HmgrNPDkFNI2HsM
         mtpPhAj+64CcizLUiuaV3FV0F2264XLVuu4O6Ul0FxuEFk/VxjcHAEitvr/JRmw1Ri
         rEsxj//YKl8fre0ZdJ55XQ0SWnC4QtqfFbniY6eQ=
Date:   Thu, 17 Aug 2023 22:47:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc:     workflows@vger.kernel.org
Subject: Re: Selective lei filters and replies to old threads
Message-ID: <2023081720-wrath-winnings-bb16@gregkh>
References: <87ttsxbvqd.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ttsxbvqd.fsf@toke.dk>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Aug 17, 2023 at 04:15:54PM +0200, Toke Høiland-Jørgensen wrote:
> [0] Side note: if anyone has a nice trick to specifically exclude Greg's
> stable patch bombs from this, I would be interested in hearing about
> that as well :)

I thought those stable patch bombs had a X- header on them, like:
	X-stable: review
and
	X-Patchwork-Hint: ignore
but somehow it looks like I'm only adding that to the first message in
the stable-patch-bomb series.

Would it help for me to fix my side and add those headers to make it
easier for you to be able to ignore them?

thanks,

greg k-h
