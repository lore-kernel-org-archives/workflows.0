Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C18CDB465
	for <workflows@archiver.kernel.org>; Thu, 12 Oct 2023 00:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbjJLAOS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 11 Oct 2023 20:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbjJLAOQ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 11 Oct 2023 20:14:16 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EFB94;
        Wed, 11 Oct 2023 17:14:15 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-66d12b3b479so1829136d6.1;
        Wed, 11 Oct 2023 17:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697069654; x=1697674454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mf4thPA0xGlGLRp6EF2qtCeNe9d7tfxbNWGpjSLKnps=;
        b=Qlir3Up2SSoQF2k7FIHKftgWZf2XwmYjfMwGUoVxLAt8pG1oMz9I2TNsU69ZV9V8cL
         9w7Q7OUqfRl9c7bh0QekxAyoTLyTT968zWySipHifB+XBaiG8B/AZ8KGjSprNPZflzmy
         nozDIs2kU+TIbE3ouxfnWK+g45LBlOen81aX9dv+VCHXf9rbTItMivOoJy/FpCUCc591
         oCpFQeR5zC5ronoeEuDH9VzzPVjIi7F4ir/Q7mUP5fc1h6E8CuRm/f/ZTZQqPN7GBzVx
         /Ixl5+tgpR2pSl98WBo3eJP6GwpGGLCGzCBTRgYTDFkJtLvNZ7ap2Sne2HLlRSbMt8qS
         2svQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697069654; x=1697674454;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mf4thPA0xGlGLRp6EF2qtCeNe9d7tfxbNWGpjSLKnps=;
        b=Yf128aFUqAHrMfqlhGdgGFQMNm9r0CveNAPQjd3IduzPO6TkC0/p4jyXGkSgU5744k
         C3dWXryga8KLNlXTdZrhAcuaQKyF+viu0060KFypqF4na79TBYw+scuHZGS1+Xx70CiH
         VPtFzwclEpT7TLpo+fZ3xxATWXG538Y+up5bJGS0A/ojFb31SRRtT3rnlzs+qGs83H2V
         /rudSAkW0Jsq7nXWPHwdpajIVxM4SjLH0XMIqc0B1SZiTe8fCr1oklM6qTwaJErm7LFf
         fmRC2ZXx43vjI4723HVo/Qh1Uj1eYgGj5NnRIduAxcaMi9LWIA4KegARiCgOej/btRNS
         XjCg==
X-Gm-Message-State: AOJu0YxGpcIq9K0wCpM9/iBAvMBENBDIyoIZJ9/UCXYvNx1enFDAeX17
        4LIdWDXM1gStQcfD5ZxBWGc=
X-Google-Smtp-Source: AGHT+IFYHIxXGgfKloHpHhm4Lqfii3ebPyy/JsQtuZyZph/+NWGwOecnLpCBXk1M2L1dEUDfy/vcOQ==
X-Received: by 2002:a0c:f647:0:b0:658:9896:91b2 with SMTP id s7-20020a0cf647000000b00658989691b2mr21778064qvm.7.1697069654101;
        Wed, 11 Oct 2023 17:14:14 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id g2-20020a05620a108200b00770f3e5618esm5594104qkk.101.2023.10.11.17.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 17:14:13 -0700 (PDT)
Message-ID: <b4ecda7f-1947-41aa-b645-1201a089c966@gmail.com>
Date:   Wed, 11 Oct 2023 17:14:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] docs: try to encourage (netdev?) reviewers
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, andrew@lunn.ch,
        jesse.brandeburg@intel.com, sd@queasysnail.net, horms@verge.net.au,
        przemyslaw.kitszel@intel.com, jiri@resnulli.us,
        ecree.xilinx@gmail.com
References: <20231011024224.161282-1-kuba@kernel.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20231011024224.161282-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



On 10/10/2023 7:42 PM, Jakub Kicinski wrote:
> Add a section to netdev maintainer doc encouraging reviewers
> to chime in on the mailing list.
> 
> The questions about "when is it okay to share feedback"
> keep coming up (most recently at netconf) and the answer
> is "pretty much always".
> 
> Extend the section of 7.AdvancedTopics.rst which deals
> with reviews a little bit to add stuff we had been recommending
> locally.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

LGTM!
-- 
Florian
