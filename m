Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79139C0015E
	for <workflows@archiver.kernel.org>; Thu, 27 Jul 2023 11:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbjG0LAa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 27 Jul 2023 07:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231753AbjG0LA2 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 27 Jul 2023 07:00:28 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EDC10D2;
        Thu, 27 Jul 2023 04:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=SeUrHxdFJ3RZqJlDRVxFRCK47CcAYACML7/6mllauh8=; b=WDS088uxJZ/fjGMxymkMqKfPsL
        J7wKHIuYsGxOoFhmKhxupP/dDj9oHaAMhox2weDF2H62O3UN+xRGh7TpIRxiiLuyaWI3zhjySZr+V
        zyxK/qI20qyZ9OQQ433CAaHc4FHHWJh79B1qQ5/hygIWQ9L5gyvgD+FdVDoZzH64ftfA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qOyj9-002Ras-9J; Thu, 27 Jul 2023 13:00:15 +0200
Date:   Thu, 27 Jul 2023 13:00:15 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from using
 file paths
Message-ID: <1b96e465-0922-4c02-b770-4b1f27bebeb8@lunn.ch>
References: <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
 <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
 <20230726130318.099f96fc@kernel.org>
 <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
 <20230726133648.54277d76@kernel.org>
 <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
 <20230726145721.52a20cb7@kernel.org>
 <20230726-june-mocha-ad6809@meerkat>
 <20230726171123.0d573f7c@kernel.org>
 <20230726-armless-ungodly-a3242f@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726-armless-ungodly-a3242f@meerkat>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

> Think as if instead of being Cc'd on patches, they got Bcc'd on them.

And how does reply work? I assume it would only go to those in To: or
Cc: ? Is there enough context in the headers in a reply for the system
to figure out who to Bcc: the reply to?

   Andrew
