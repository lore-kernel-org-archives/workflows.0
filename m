Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617041DED7B
	for <workflows@vger.kernel.org>; Mon, 18 Nov 2024 22:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731969515; cv=none; b=nnxC0UYwJNvOdoxh54YsRF0Jiphz6fS/y63ATBAeDQavPc4GTMVCJyVBxJ09ffW8VCxr1BvOa/+juGO0/i3161FWaEqO06JYRGR1SSc5fAz7BDX6fQgrxu6mj/2SXPBIyMPyAqDxtRU+QvzMJ30lNRzLowoKfLsQc7friGOHTro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731969515; c=relaxed/simple;
	bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=GwiF8oCyB4MAHvm5d0eOyl/Snpdhz/TM1LynjkO0GkjJ8Ze41Tnga+1kF38rJvSL5McES5LPvRkk5xXK6dFYdfU03TIhMZKwKW2hh53M+qRpazi6rCmEJrVwCaqhW8p2flf2pCm/o0rtgFGvifiQg/XHAGPU/Tye+w0vfydUG28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCtRX3c1; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCtRX3c1"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so2092865e9.1
        for <workflows@vger.kernel.org>; Mon, 18 Nov 2024 14:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731969512; x=1732574312; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=HCtRX3c18sI3aPa9XCz5vRxJTdq6Uo9eSakbcAgMUv4nTaDNUIdAUIkAqYGjr0SsCE
         qmrR5WntmWna2E0U/qXPW0jAfPwCpo9xO+BcpSWh85WazYbqOKtxgVlk7FyyOYMbyoNp
         uotAKoP4b9zOL1TGhCDDfMv0m93EM9+QLHdYLgxqv5X+yV5KvsBrhy8CoRzHUujncIX/
         VHyg3mYDl5RHEeLKIFRQqShvOfZT9wGw1Dwbmp+P/EPUCt0rXMinzYuzNFKWD0YIWneJ
         KG6Ksetsu2+a7MSYdfeFZ5+FCj7zX2R/3OdaULsmFuFI4tpe0GWCriyYXPAfZimNxnu8
         3A8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731969512; x=1732574312;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=EEa3eMpAljvYV8N3sUSjzjDOR9AYzxavN2UT0mv678j+CzWVKnQZFzPgob4vHbIjov
         /JwGov6vwbzI/UBWC5jFXmIwRjaDpXqNlZPn8snX+Q7LX/5M+0gS4sDY32WmzPJ2KJ5d
         S1LY1cjCsL6kg1NYKoiNuYCJ/ePJtDnS/yF1qRU3fHXGqSuKOA+9BnvNYm10eu1QagJE
         QEFG45/9tHUqNWrpdKzo7lPhlujzEN62vpmCZDNiTVGgCi5RGIYTdjpNTfe1jhQKgsQE
         G6Hnuc4hdN0b6gJN/b75+hIlFAlZOyayeLIDq9ayoZp3VlK0U0jaxInLbVyrGWTexSZb
         6uMA==
X-Gm-Message-State: AOJu0Yzf9Aj1PiVRbYtAM3kUOeYDYNup/TL7fxujMOL2gPR8TSRPTeXp
	nGUcW5IxhtoY0KRLQXVRIEtPRh6GSDsgirVjZ9mqKSd0nRuysLzdUYsRqJA+
X-Google-Smtp-Source: AGHT+IGzjj9heN4kpn14cBAy/8nl3HyXQtqtQ5V5LF/VkIf08BjUShwqP2iD34gSUmarT0bocRcxxA==
X-Received: by 2002:a05:600c:a16:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-432df728fb6mr117844265e9.11.1731969512328;
        Mon, 18 Nov 2024 14:38:32 -0800 (PST)
Received: from [87.120.84.56] ([87.120.84.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab807d4sm169886065e9.21.2024.11.18.14.38.30
        for <workflows@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2024 14:38:31 -0800 (PST)
From: William Cheung <eshansarma772@gmail.com>
X-Google-Original-From: William Cheung <info@gmail.com>
Message-ID: <eb794d26956c1fc6866f99da54ea8f6a23c71cfd4d9b36e824fdd83cd313ed7e@mx.google.com>
Reply-To: willchg@hotmail.com
To: workflows@vger.kernel.org
Subject: A Proposal
Date: Mon, 18 Nov 2024 14:38:19 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

I have a lucratuve proposal for you, reply for more info.
