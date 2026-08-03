Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055A23264E9;
	Mon,  3 Aug 2026 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771452; cv=none; b=VDt1CuiJ8SUkXXjHOjYUvAptci8QAZG/RgE2RePX9c7pYoTmdgMGVYgSVXlQAd/Oyyluk5KVCs+cjdnYRZ96BXkIsfAlH1frlu2VZyIegfabuFaud4F68m03/Oospy+OdSl22CCZ+J434bvvtxGTkxGsGCzATlHrVBjkgIEwnzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771452; c=relaxed/simple;
	bh=G9fLvzELv0jvpRlcXQxzyLv6GyQc40lvnjhwwd+jZ/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTz2R+nigNjG67pC/WgwIBdRME0xMOyls9zQqLNcsplzSV8nX7iM/ZU5PWchn3KkSKfmCGL7VJdgTHOfOO4IREPczh1oVA18frYtxd14QzHj1Y3i+i96c0jxpyn3R+bdfSmHimmjbeeqPgxUCJoSdoq/LO99W7KG4JmgPn3DW18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Dg0ndXd3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OZ26c8MO; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Dg0ndXd3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OZ26c8MO"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id DBA381D000D3;
	Mon,  3 Aug 2026 11:37:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 03 Aug 2026 11:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1785771449; x=1785857849; bh=SsUKbtca9q
	AXmzY8UMUcO6a1migdip91XzAY+7o9GH8=; b=Dg0ndXd3WFnwMurwARxE0kkRUZ
	8NPybitpJrPJM/OZpBbhGwz4vj3mgjNgHdW/+tzdhp4GcMTSTlzwiVlfZh4W0bzt
	JPzhHHeqw2ceUoKy41fC5/PyK7LgZ5Zd4N2lIKX3YtsrF1VDQoPAYem4kBLtMeb9
	udT7YaTUKrJvkhcCM2GJT0MzlaH/hfkgN7kaJGOMiKB38l2igN9V0K4S/6ya1Apj
	73kR5nEGO8ru4Zqthzlmo7j9csJ2QvtQW4EKVsfag2YLSOjUE0Cu6qsBRFjgVL5g
	Vic2fHyigtFqNLLEjgLG+b1c/c+OWDYmonRXRg4HUQfXeL+FGWIFUAEzp+BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785771449; x=1785857849; bh=SsUKbtca9qAXmzY8UMUcO6a1migdip91XzA
	Y+7o9GH8=; b=OZ26c8MOmMDUMKhdpMrrV7eCy/Amiaht2cKG/0sRkI3nZIKv0Up
	lVk4012oxBmv3noWVtWq0h3V1hIxGILu+qvGVBZ66AJttws4BO3eVzSEzjtnIhMz
	sBVJf19eiOs5QsvCNdGf+XjCFWi/6x53rdrnXjY4FpFqYvr8kSR2MuvMxHiQ5IT2
	WKmXSLwNbKRo2f0SWGlD8V//14VKgAlbZE2Bgd5h8fD1vt7cx9Pi1no0gmay9dWb
	kEBVg1WFBfTHBZqJxBVoADY/R1DK5lfzjXBxRmzlZ4JZA8K9Z127MWGL+0qIaAKd
	7fCodyB1RjxkkfZr3Eyf+g45gxXDjYs9JTQ==
X-ME-Sender: <xms:ubVwalDKcUm0paWzbsq8dTg1bBvgvjhtJ6tV4TE2YEqzSqsQFLzlsA>
    <xme:ubVwai8oXn5FdrYQbjxDyEDrMU8EgyOXsi6lhy1rYpbHM8AT_bElXvrqP_zr2C5E_
    wSzUe7NcvFcIcHv1r0rL7sTRh5a7mDX92FtV-4VWrm7YCV4Kes>
X-ME-Received: <xmr:ubVwahpbsMdx-g4JQiyCsFDrgBPx2Z5mv19_xCylbLi6fg7LJ9w8AxM8C8g4Wikq-A0atfIVcVk7HC5J4p20yFw4cI3DUUOdvajTzUOyQfI>
X-ME-Proxy-Cause: dmFkZTEZq0wzGqSEskL9D3hTnsCxXHHSnpmnz4pe5SrxV2rlQokWhSUCNeMdgq6cQ31D0O
    gyNgtNmXWm3VGtPX9vPXCNOK2OAUO63C59ctewQU/lyQhnGGjakwVgDLtV4omV5VLWtJG2
    2tIydNwPp8C7za3Z04m7TOSZuPyJrNMcKwID8/JCwtseB5J4XyB8pF7L/XIOqGSc0zMGOB
    i4Beg/nMggFd8dLjioPj6a8ZTXN1b174xp4AGTzhSzAIT6J94/3s3yx6oisWaCvrmZWVC6
    Z+sgaDF/SXSbKxWX6NbArwEHc1LFz1jomIwj8nXa73u5whtZgmKlbj70VN9dSZULMQZzLl
    mTsKfdrWr9aP/vJVimDThvtqq/ixNEZLb5tWp78cx5DukdNO65yvU4/KxjxoD8Z3Tq404N
    oTAQsVpU0vNjQ+R+vhdffpmu4a3XRLhGwHjGhJ1IVQWOAPG/LwzuhmSgn27sZ3p/FYGbHd
    unbl08tski+P6bSzkpaEFkX8f74G3hqXxeFvjJWmO0pk2WtjTgQ3jDKoTZbtz41vJdQekQ
    GTB9andU+6HCQYlvD3ar7+gSXefWqjX7rLc2FrupAT3dGnBrhV3WmSTm2o7MtdGQ011x+h
    WXS0hIONBmgIE/BWIzLQ4l4vs4KW8i5oAz8JvXF88o0b5UDF6gBNZ2wrTCpQ
X-ME-Proxy: <xmx:ubVwakGZkjM6_SRMA1Zpa3Mc22HyByQnCl-4s4U4gm7t-DnlKRCs9A>
    <xmx:ubVwat8W67HzkMl5-D-DLDH4o00r4sjvviAXVlBxyCVUv9TbPQN-tA>
    <xmx:ubVwapTmysVI7AQV_UxhJYUddjfy0AVIogL2vkBhoJyvKmIdg3_VrA>
    <xmx:ubVwaqovqIX3v9I4IoPAzr_BEC9jXL765F8OxpEzUNhbZOP1W_NdiA>
    <xmx:ubVwakd6bCmXKCm1agl4grKmW6plHW9brdi7hA0DPT69SUJyv9LPaYxZ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 11:37:28 -0400 (EDT)
Date: Mon, 3 Aug 2026 17:37:14 +0200
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Jonathan Corbet <corbet@lwn.net>, security@kernel.org,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] docs: improve guidance for AI-assisted bug reports
Message-ID: <2026080335-edition-chop-5e15@gregkh>
References: <20260802203540.3453-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802203540.3453-1-w@1wt.eu>

On Sun, Aug 02, 2026 at 10:35:35PM +0200, Willy Tarreau wrote:
> While vulnerability reporters have now started CCing maintainers,
> showing they read the docs, the security team still spends a lot of
> time repeating the same comments about tested version, incomplete
> fixes, poor email client setup causing formatting issues making
> patches unusable, unverified reports and missing Assisted-By tags,
> each time for AI-assisted reports.
> 
> This series adds small updates to security-bugs.rst, threat-model.rst
> and coding-assistant.rst to better deal with this and provide minimal
> instructions helping the LLM follow our expectations.
> 
> The updates were iteratively and carefully tested with 3 models,
> Opus-5, Qwen3.6-27B-Architect-Polaris2-Fable-B-F451, and Gemini,
> until all of them strictly followed the rules.
> 
> It is expected to further improve the situation.
> 
> Willy Tarreau (5):
>   docs: threat-model: clarify "security bug" vs "vulnerability"
>   docs: threat-model: move fake devices out of "non production use"
>   docs: security-bugs: clarify what counts as a valid version
>   docs: coding-assistant: explain important steps when looking for bugs
>   docs: security-bugs: clarify some mandatory steps for AI reports
> 
>  Documentation/process/coding-assistants.rst | 37 +++++++++++++++++++
>  Documentation/process/security-bugs.rst     | 26 ++++++++++++++
>  Documentation/process/threat-model.rst      | 39 ++++++++++++---------
>  3 files changed, 85 insertions(+), 17 deletions(-)
> 
> -- 
> 2.52.0
> 

All of these look great, thanks for them!  I'll wait a day or two before
committing them to my tree and getting them to Linus for 7.2-final to
hopefully quell the onslaught of "bad" bugs being reported...

greg k-h
