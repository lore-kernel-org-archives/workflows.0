Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6602B233721;
	Wed, 19 Nov 2025 06:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763532636; cv=none; b=Ikf0YQ4/M2iNd+LuSuEWfN/oOffhGnSlYcNCKe+G06TpPx6wLlzNYTt+9GZ8y4rKMlmQM9alJ4b8nFNe+UO5IdJcMuyRZQEKRt/GQJYvyXOKG9hQ2OadW1vcYAZIn7j865RbYGJ7K8f415F1bHMIHIp45q/zgXk8n1P1PI4CQt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763532636; c=relaxed/simple;
	bh=Pw6ye42QDxcpX1AjpiSarCsQ9Iv5adam377PksSn2hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5ZkhX6GZGvq3v8Zb43cIHlFRHaQmlpU8JF4v9uUwc3+IZSqumJB+GaYkb3wuhbCOtuVaZiUtJVLPL9bohEX5NawniERMutTmQkx4HAsGUK/Pt7ypKQkpr/EDYoji+NAT1COHtVZZIKpHUXlcjwC0WiWRElr3EpTXwFu4t3VweA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=M5HG5RtE; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="M5HG5RtE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=96SmmTAcW+L3SgVJziGlix5kOs3wWTYGrgkGWEghMHk=; b=M5HG5RtE1DusLfWYUSHBkJUSgd
	L34d4N7Tb5O66hPF0POiemxV/cGWIATId7TPg/I7P/mOG1k5SQAA16G+rdpvWLTBYRoodMAIs4dbo
	TxZ+e+1yDLczhVYy2Ip+BTtSh52MJXaYaHWInrMVsmqfr3t6MNa1sFIB4e7+NrpWxKyob7HrHdmcG
	XQQru2N1ZU18yi190fWG7ilK6NGU288Iou6CYtPGRYMPMnQSubBa+b8ULttV3eMO0qO17JF88QC0w
	EdyejfpEjbdPZjVM7WXCRyafWB0csXnGtuUGDkhY7oJQpgwar9VipSoEfnsm7wc2FJTH+WPe3fMlm
	YCNv1VEg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLbOj-00000002cdk-014Z;
	Wed, 19 Nov 2025 06:10:33 +0000
Message-ID: <74bf507d-5c29-4e9c-a6d6-afc0ec012688@infradead.org>
Date: Tue, 18 Nov 2025 22:10:32 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] README: restructure with role-based documentation and
 guidelines
To: Sasha Levin <sashal@kernel.org>, corbet@lwn.net, linux-doc@vger.kernel.org
Cc: josh@joshtriplett.org, kees@kernel.org, konstantin@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 workflows@vger.kernel.org, joe@perches.com
References: <20251119023832.1095490-1-sashal@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251119023832.1095490-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/18/25 6:38 PM, Sasha Levin wrote:
> Reorganize README to provide targeted documentation paths for different user
> roles including developers, researchers, security experts, maintainers, and AI
> coding assistants. Add quick start section and essential docs links.
> 
> Include proper attribution requirements for AI-assisted contributions using
> Assisted-by tags with agent details and tools used.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>

I like it except the commit message needs some rework (deletions).

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
> Changes since v3:
> 
>  - No AI hype 🙂
>  - Link to a guide for building the kernel
> 
> 
>  README | 160 +++++++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 149 insertions(+), 11 deletions(-)

-- 
~Randy
