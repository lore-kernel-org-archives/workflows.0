Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C685C001DC
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 16:51:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjGZQvg convert rfc822-to-8bit (ORCPT
        <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 12:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjGZQve (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 12:51:34 -0400
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41CBDA;
        Wed, 26 Jul 2023 09:51:33 -0700 (PDT)
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay08.hostedemail.com (Postfix) with ESMTP id 1E092140213;
        Wed, 26 Jul 2023 16:51:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 1198820013;
        Wed, 26 Jul 2023 16:51:28 +0000 (UTC)
Message-ID: <dd18599fb75350b0b359134f5b43625fb9208943.camel@perches.com>
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from
 using file paths
From:   Joe Perches <joe@perches.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Date:   Wed, 26 Jul 2023 09:51:28 -0700
In-Reply-To: <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
References: <20230726151515.1650519-1-kuba@kernel.org>
         <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
         <20230726092312.799503d6@kernel.org>
         <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 1198820013
X-Rspamd-Server: rspamout06
X-Stat-Signature: 8xoc1pa17ewpfstimn3bausji9z3cea9
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX188wytRJcomDW0C9fGvXQuLbDZ88wVSRlo=
X-HE-Tag: 1690390288-95582
X-HE-Meta: U2FsdGVkX1/WBFHFsnVkAh3pxIZDJRgtHT5ulI26muZfxzFGDdatyakLeRidqhbVyrBUvzvOcM7I2tdGEhyapEXxJLy711Uy2U6E/M8Hm/c/z3MZSBLhzriU7/9Qzie0HnPatecQDSKyokCOYWasQe5UqFr+Rfdgzfuc9iG7Dnn5e0xyLlTlLCYG2TPpN5tiUnon4KUTqIl4DSbOS+ofCKPU9LaqIO2KuDYpwmOhxevpTAjhhkn7kMavNc3G5J4lyOUeDu/JLb6zeU8COP8cOaxg/oc960weNgjtZxIJ92dlV95XbCCa6YRu0MvB//Mc
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 2023-07-26 at 09:45 -0700, Linus Torvalds wrote:

> So the whole "use of get_maintainers is only for patches, and we
> should warn about file paths" is insane.

Agree.

