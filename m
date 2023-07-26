Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CCBC001B0
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 15:43:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234907AbjGZPno convert rfc822-to-8bit (ORCPT
        <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 11:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231894AbjGZPnn (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 11:43:43 -0400
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127C52707;
        Wed, 26 Jul 2023 08:43:35 -0700 (PDT)
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay09.hostedemail.com (Postfix) with ESMTP id DC232801FD;
        Wed, 26 Jul 2023 15:43:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id 2B4B53B;
        Wed, 26 Jul 2023 15:43:31 +0000 (UTC)
Message-ID: <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from
 using file paths
From:   Joe Perches <joe@perches.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Date:   Wed, 26 Jul 2023 08:43:30 -0700
In-Reply-To: <20230726151515.1650519-1-kuba@kernel.org>
References: <20230726151515.1650519-1-kuba@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 2B4B53B
X-Stat-Signature: kekwf3boy5oqzgutd3xcrgxyb8zmqfpo
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+72Wd9vEYwCd4qCLZ11+p0SIW+an4W+Ow=
X-HE-Tag: 1690386211-699822
X-HE-Meta: U2FsdGVkX1+UpmbqDRhQT+3wZngmi/dvSPNsMFg4A3BVrNxgZT2Qs75z/BS6gQx5s4JQZdKTYCtnX1LDu0K5hNYg06QJzsP8EFz53UQsqRBlCi4mL+/LiRJVrdQYFpVhkITK8cYKBRGSPOlKj1L12dR6Pev3YbhDU8tryOpiGzW5GxgU4cmbe8OMEsgrfZqT141Islyw7Nr41WcF9FAHbWgYQXC6DEvbSSVL/jCt5CUYUflMFI4+28y1iTkD6uBm8/se5jpMEOkTF3/KTTdCc+ijx/vlixdGJTh5V8JyPxjbIdQJS7+xg4YEpTvPH8ns
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 2023-07-26 at 08:15 -0700, Jakub Kicinski wrote:
> We repeatedly see netcomers misuse get_maintainer by running it on

newcomers

> Print a warning when someone tries to use -f and remove
> the "auto-guessing" of file paths.

Nack on that bit.
My recollection is it's Linus' preferred mechanism.

