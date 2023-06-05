Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7BCC7EE24
	for <workflows@archiver.kernel.org>; Mon,  5 Jun 2023 13:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbjFENXB (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 5 Jun 2023 09:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234074AbjFENWy (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 5 Jun 2023 09:22:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F963E8;
        Mon,  5 Jun 2023 06:22:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1D6926135D;
        Mon,  5 Jun 2023 13:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B40C433EF;
        Mon,  5 Jun 2023 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685971371;
        bh=D+wLYJzu2/pXXMSVBGepoNQlQOYNfxiCMKpy/k9lfyw=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=jyODRj7mWpuz6YmIK2xBbc08Vqnzl+voFynyPecSY17eqGzonTne3pcCtTNSzgo4S
         7DnJR9B9NqIARyOPlAoD1vhu/8aFTmFGVO9DODIj2+ZfA8d81pGRDgAYKRjxq97f0B
         mKfwdbNxEXV5f53r8nQE6XsvveC6mpTxPL+VVpm+dM09e69HTZhEX1Z3xyS/GM3Rys
         6pz9u0JxS6N8ZP0IO967dAWiGEzgz2hSHr1GZPiFNfVYXHyaOw2cFC7smIPJKJICCE
         kBviytvJwFJSV/nLQjNKJr2gXMBl5eJN/0jvSdtV+mHpzFT6kzE1IPZWjSzyMR6f7v
         Qf5l59G8LSDiw==
From:   Kalle Valo <kvalo@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jakub Kicinski <kuba@kernel.org>, Willy Tarreau <w@1wt.eu>,
        Randy Dunlap <rdunlap@infradead.org>,
        James Seo <james@equiv.tech>, Jonathan Corbet <corbet@lwn.net>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC] docs: process: Send patches 'To' maintainers and 'Cc' lists
References: <20230603151447.29288-1-james@equiv.tech>
        <975d35cb-e0aa-8ea7-5520-238d1aa4cbaf@infradead.org>
        <20230603160659.GA5182@1wt.eu> <20230604112644.49ac2035@kernel.org>
        <20230605041258.GA22604@pendragon.ideasonboard.com>
Date:   Mon, 05 Jun 2023 16:22:46 +0300
In-Reply-To: <20230605041258.GA22604@pendragon.ideasonboard.com> (Laurent
        Pinchart's message of "Mon, 5 Jun 2023 07:12:58 +0300")
Message-ID: <87v8g2hwm1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> On Sun, Jun 04, 2023 at 11:26:44AM -0700, Jakub Kicinski wrote:
>> On Sat, 3 Jun 2023 18:06:59 +0200 Willy Tarreau wrote:
>> > > I think that is going overboard (too far). As long as a maintainer
>> > > is a direct recipient of the email (patch), that should be sufficient.  
>> > 
>> > Or it could be simplified, saying that all those who are expected to
>> > play a role on the patchset (review, test, merge etc) should be in the
>> > 'To' field while those who might possibly be interested in having a
>> > look are in 'Cc' (lists, other people having expressed interest in the
>> > patchset, single-time contributors to the file being changed etc). It
>> > could be hinted that usually people read mails sent to them faster than
>> > those they're CCed. This implies that maintainers have to be in To and
>> > lists in Cc.
>> 
>> It's useful when maintainer (or group thereof) who are expected to apply
>> the patch are in the To:
>> Who applies the patch is not information a noob may know but it may be
>> worth writing down as best practice?
>
> Note that some maintainers process pull requests from patchwork, not
> from their mailbox, and prefer not to be aadressed in the To or CC
> headers. I don't know how widespread that is.

FWIW I belong to this group and prefer not be in To or Cc, I'll always
check the patch from patchwork.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
