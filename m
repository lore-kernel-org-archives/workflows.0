Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23AFC001E0
	for <workflows@archiver.kernel.org>; Mon, 17 Jul 2023 07:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbjGQHvk (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 17 Jul 2023 03:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbjGQHvh (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 17 Jul 2023 03:51:37 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF7710D1
        for <workflows@vger.kernel.org>; Mon, 17 Jul 2023 00:51:35 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9924ac01f98so594326466b.1
        for <workflows@vger.kernel.org>; Mon, 17 Jul 2023 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689580294; x=1692172294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uvg71QsN0uCFu9CbEe1Sgbll38wTsgcP92il4EjQ13Q=;
        b=afUDFnWslzRUMlvGsAyM5A/z8Bgtlq808C4XiCAFTBhDVGlcc1DArSGKnmTN18sx3r
         VdlQb7AHdvUMrbi/Uwwk0d1yLXJRa6NbD4LK0CW/kuR64GlgSMBp635g69iIEFyAza8r
         5TihJlZ37HbgiCIToe5/KsXb8leVQ5cvE1LPhPLYVSmL6aHHykf2G5sMW/hhyBf369d6
         gZzA4Q3O8kl3EWM7Shkp+smySIQDaWIdP6qWFbjMvOEiAblXtD0MTc++C7Cl7xs2EMsn
         2fUIRUfXW7fWLePSK3kWZ+8NTVP3nh+epbxz8zqqRV21SdlZfgKNF9mU0gFU6ahbmcAH
         4P8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689580294; x=1692172294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvg71QsN0uCFu9CbEe1Sgbll38wTsgcP92il4EjQ13Q=;
        b=SNq78gXDAlnMveiQ+CNpFkG7WIHZrohvpYZzNtWARvrM4to+bqU8+TFMiVVtYIlwA/
         PTvZelNx0lx6hYfqRlfqrLoqpZnkE3mdnOywzik6efpGHIqCkbZewAXHHd3mTJMa7hvy
         mCUvOwx1vCwtpszctea3zPnwQ/Xk4HFs3L6+VWANwAt/vsYXDAGblAnJwenyxGM6BLsg
         fi3oLeqUkJDmWp2P72voYzoWsAXCz8nqapqfdNIIyFPOb8mF9qEHlypoNaU6LVO/5YDy
         Dnwwa0PakMtxRcCejfw0LhvQAMdlE+L0dicHxSILrKyErVI3qs/D6TUgiTnE8cwcxxSZ
         Wdow==
X-Gm-Message-State: ABy/qLYYdqKWkPnGbqGNPB6+hjlXjVV8I+2LPBs1VVq8hMLUN0c/iyFr
        Qm/pdPeJ/tR6HVjzaX3a/63BSw==
X-Google-Smtp-Source: APBJJlHmmTlSB2Ghvbk6jeJZtE3VwyqV0OVfQcEjYy7JfCuFCYa6mTUTHJIFKKAjd+BkT2SKHTXiaQ==
X-Received: by 2002:a17:906:2096:b0:992:630f:98b6 with SMTP id 22-20020a170906209600b00992630f98b6mr10600981ejq.37.1689580294094;
        Mon, 17 Jul 2023 00:51:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u11-20020a1709063b8b00b0098e4aef0791sm8863674ejf.66.2023.07.17.00.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:51:33 -0700 (PDT)
Message-ID: <4963b85c-c0ff-92a1-e5d6-ca76f1882f93@linaro.org>
Date:   Mon, 17 Jul 2023 09:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] Documentation/process: maintainer-soc: add clean
 platforms profile
Content-Language: en-US
To:     dsterba@suse.cz
Cc:     Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Nishanth Menon <nm@ti.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
 <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>
 <20230714135914.GI20457@twin.jikos.cz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714135914.GI20457@twin.jikos.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 14/07/2023 15:59, David Sterba wrote:
> On Fri, Jul 14, 2023 at 10:47:24AM +0200, Krzysztof Kozlowski wrote:
>> +Overview
>> +--------
>> +
>> +SoC platforms or subarchitectures follow all the rules from
>> +Documentation/process/maintainer-soc.rst.  However platforms referencing this
> 
> Just a drive by comment, references to highly relevant documents should
> be clickable, so :doc:`Documentation/process/maintainer-soc` , with
> exceptions like if the document has been referenced already.

Is it needed though? The link is anyway detected by sphinx.

Best regards,
Krzysztof

