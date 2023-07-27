Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198FFC0015E
	for <workflows@archiver.kernel.org>; Thu, 27 Jul 2023 01:07:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjG0BH3 convert rfc822-to-8bit (ORCPT
        <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 21:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjG0BH2 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 21:07:28 -0400
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A1D26B9;
        Wed, 26 Jul 2023 18:07:27 -0700 (PDT)
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay08.hostedemail.com (Postfix) with ESMTP id 2E08914060A;
        Thu, 27 Jul 2023 01:07:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 4A8492000F;
        Thu, 27 Jul 2023 01:07:23 +0000 (UTC)
Message-ID: <fc15ea8473859edf99b7aa61baaf3d4201f1a727.camel@perches.com>
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from
 using file paths
From:   Joe Perches <joe@perches.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Date:   Wed, 26 Jul 2023 18:07:22 -0700
In-Reply-To: <20230726-yeah-acrobat-ba1acf@meerkat>
References: <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
         <20230726130318.099f96fc@kernel.org>
         <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
         <20230726133648.54277d76@kernel.org>
         <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
         <20230726145721.52a20cb7@kernel.org> <20230726-june-mocha-ad6809@meerkat>
         <20230726171123.0d573f7c@kernel.org>
         <20230726-armless-ungodly-a3242f@meerkat>
         <20230726172758.3f6462f3@kernel.org> <20230726-yeah-acrobat-ba1acf@meerkat>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4A8492000F
X-Stat-Signature: t8df3fdhzrnkasyjqii8mba913wq97qx
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX184JVLub2iiWxXcylxpU9WrSJX/fYBzEdI=
X-HE-Tag: 1690420043-775472
X-HE-Meta: U2FsdGVkX1+FklBYGJtPT/syCvk0kdDdoP/lMTwQrxQkiD4BgYkk1jbvdEtFSEZv9pQLM6668LAiTuGoQpsvj/i2ye639Li4+HZuoGw0xXSTnX4RwB7ibf+9oCSiz4R/rAE+WZ68bP/BX24UjrwRemxd/S+Tg2Sp38I+Ull/On54JEo7Vbc3UDU8LmOtocOitoGLuO85wFtkFXZj3Z5UhRqPyZ7UUkGJnxai4L2apJ1S7WVD/5Zh/wgGLIKeoe5qTJI2Lp7HIYlR/CdTtcuwCPdB8xNFyVHlBsbFx3jcc6QiMalVwhi2cZqITSKr5WpRF+JlFeizpDcGF6wmbbIU3j2P6sIIjV42/hzAz2yZhM2VR/OVF8sxHaL13vCzN7XH
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 2023-07-26 at 20:33 -0400, Konstantin Ryabitsev wrote:
> On Wed, Jul 26, 2023 at 05:27:58PM -0700, Jakub Kicinski wrote:
> > > Think as if instead of being Cc'd on patches, they got Bcc'd on them.
> > 
> > I was being crafty 'cause if the CC is present in the lore archive
> > our patchwork check would see it :] 
> > But cant just trust the automation and kill the check, then.
> 
> If we can get it working reliably and to everyone's satisfaction,

big if.  great concept though.

arch wide changes are different.
API changes are different.
staging patches are different.

It'll take a bit of settling and some special case handling
but I believe it'd work out quite well in long run to have a
patches@vger.kernel.org address front end that is a scripted
exploder to the appropriate maintainers, reviewers, mailing
lists etc.



