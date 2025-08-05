# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Sample tech news articles
articles_data = [
  {
    title: "Apple Vision Pro 2 Rumored to Launch in 2025 with Major Improvements",
    summary: "New reports suggest Apple is working on a second-generation Vision Pro headset with better displays, lighter weight, and more affordable pricing.",
    content: "Apple's Vision Pro headset made waves when it launched earlier this year, but rumors are already swirling about its successor. According to industry analyst Ming-Chi Kuo, Apple is planning significant improvements for the Vision Pro 2, including higher-resolution displays, a lighter form factor, and potentially more affordable pricing.\n\nThe current Vision Pro has been praised for its stunning display quality and innovative mixed reality capabilities, but its $3,499 price tag has limited its appeal to enterprise users and early adopters. The new version is expected to address some of these concerns while maintaining the premium experience Apple is known for.\n\nKey improvements may include more efficient processors that generate less heat, allowing for a more comfortable wearing experience during extended use. Apple is also reportedly working on new materials to reduce the overall weight of the device, which currently weighs about 650 grams.\n\nThe company is also said to be developing new apps and partnerships to expand the Vision Pro ecosystem, making it more appealing to mainstream consumers. With major competitors like Meta continuing to push forward with their own VR and AR initiatives, Apple will need to move quickly to maintain its technological edge in this emerging market.",
    author: "Sarah Chen",
    published_at: 2.hours.ago,
    category: "VR/AR",
    image_url: "https://images.unsplash.com/photo-1592478411213-6153e4ebc696?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
  },
  {
    title: "Google Announces Gemini Ultra: The Most Powerful AI Model Yet",
    summary: "Google's latest AI model claims to outperform GPT-4 in multiple benchmarks, marking a significant milestone in the AI race.",
    content: "Google has unveiled Gemini Ultra, its most advanced AI model to date, claiming significant improvements over previous generations and competitive performance against OpenAI's GPT-4. The announcement comes as the AI race continues to intensify among tech giants.\n\nGemini Ultra demonstrates superior performance across various tasks including coding, mathematical reasoning, and creative writing. In Google's internal benchmarks, the model showed a 25% improvement in complex reasoning tasks compared to its predecessor.\n\nThe model introduces several innovative features, including enhanced multimodal capabilities that allow it to process text, images, and audio simultaneously. This makes it particularly powerful for applications requiring understanding of multiple data types.\n\nGoogle plans to integrate Gemini Ultra across its product ecosystem, starting with enhanced search capabilities and Google Workspace applications. Developers will gain access to the model through Google Cloud's AI platform, with pricing competitive to existing market leaders.\n\nThe release represents Google's most significant push to regain leadership in the AI space after falling behind OpenAI's ChatGPT in consumer mindshare. Industry experts are watching closely to see how this affects the broader AI landscape and adoption patterns.",
    author: "Michael Rodriguez",
    published_at: 6.hours.ago,
    category: "AI",
    image_url: "https://images.unsplash.com/photo-1677442136019-21780ecad995?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
  },
  {
    title: "Tesla Cybertruck Finally Hits Production Targets",
    summary: "After years of delays, Tesla has announced it's meeting its production goals for the highly anticipated Cybertruck.",
    content: "Tesla has finally reached its production targets for the Cybertruck, nearly four years after its initial announcement. The electric vehicle manufacturer confirmed that its Austin Gigafactory is now producing 1,000 Cybertrucks per week, a significant milestone for the long-delayed vehicle.\n\nThe Cybertruck's journey to production has been fraught with challenges, including supply chain issues, design modifications, and manufacturing complexities. The vehicle's unique angular design required new production techniques and specialized equipment, contributing to the extended development timeline.\n\nInitial customer reviews have been largely positive, praising the truck's impressive range of up to 340 miles, rapid acceleration, and innovative features like the vault-like tonneau cover. However, some early adopters have reported minor software issues and build quality concerns typical of new Tesla models.\n\nTesla CEO Elon Musk expressed satisfaction with the production milestone, noting that the company is already working on expanding capacity to meet the substantial backlog of pre-orders. Industry analysts estimate that Tesla has received over 1.5 million reservations for the Cybertruck.\n\nThe success of the Cybertruck could significantly impact the electric truck market, putting pressure on competitors like Ford's F-150 Lightning and Rivian's R1T. With Tesla's proven ability to scale production and reduce costs over time, the Cybertruck may become a formidable force in the growing electric vehicle segment.",
    author: "David Kim",
    published_at: 1.day.ago,
    category: "EVs",
    image_url: "https://images.unsplash.com/photo-1617788138017-80ad40651399?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
  },
  {
    title: "Meta's Quest 3 Outsells Quest 2 in First Month",
    summary: "Meta's latest VR headset is showing strong early adoption, suggesting growing mainstream interest in virtual reality.",
    content: "Meta's Quest 3 has achieved remarkable early success, outselling its predecessor, the Quest 2, in its first month of availability. This performance indicates growing consumer confidence in VR technology and Meta's continued dominance in the standalone VR market.\n\nThe Quest 3 brings significant improvements over the Quest 2, including higher-resolution displays, more powerful processing capabilities, and enhanced mixed reality features. The device starts at $499, positioning it competitively against other premium VR headsets.\n\nKey factors driving adoption include a strong launch lineup of games and applications, improved comfort during extended use, and better hand tracking capabilities. The headset's mixed reality features, which blend virtual objects with the real world, have been particularly well-received by users.\n\nMeta has been investing heavily in VR content and developer tools, creating a robust ecosystem that supports the hardware. The company's Reality Labs division continues to pour billions into VR and AR research, despite ongoing losses in the segment.\n\nIndustry observers see the Quest 3's success as validation of Meta's long-term vision for the metaverse. As VR technology becomes more accessible and content libraries expand, mainstream adoption appears to be accelerating beyond early adopter communities.",
    author: "Jessica Thompson",
    published_at: 3.days.ago,
    category: "VR/AR",
    image_url: "https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
  },
  {
    title: "OpenAI Introduces GPT-4 Turbo with 128K Context Window",
    summary: "The latest update to GPT-4 can now process much longer documents and conversations, opening new possibilities for AI applications.",
    content: "OpenAI has released GPT-4 Turbo, a significant update to its flagship language model that dramatically expands the context window to 128,000 tokens. This improvement allows the AI to process and maintain coherence across much longer documents and conversations.\n\nThe expanded context window is equivalent to about 100 pages of text, making GPT-4 Turbo particularly useful for analyzing lengthy documents, maintaining context in extended conversations, and working with large codebases. This addresses one of the key limitations of previous models.\n\nIn addition to the larger context window, GPT-4 Turbo features updated knowledge with information up to April 2024, improved instruction following, and better performance on complex reasoning tasks. The model also includes enhanced code generation capabilities and better multilingual support.\n\nOpenAI has also announced reduced pricing for the new model, making advanced AI capabilities more accessible to developers and businesses. The API costs have been reduced by up to 50% compared to the previous GPT-4 model, likely to encourage broader adoption.\n\nDevelopers are already finding innovative applications for the extended context capabilities, including document analysis tools, advanced chatbots, and sophisticated code review systems. The update represents a significant step forward in making AI more practical for real-world applications.",
    author: "Alex Park",
    published_at: 5.days.ago,
    category: "AI",
    image_url: "https://images.unsplash.com/photo-1676299081847-824916de030a?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
  },
  {
    title: "Samsung Galaxy S24 Ultra Review: The Photography Powerhouse",
    summary: "Samsung's latest flagship smartphone pushes mobile photography to new heights with its advanced camera system and AI enhancements.",
    content: "Samsung's Galaxy S24 Ultra represents the pinnacle of Android smartphone technology, particularly excelling in mobile photography with its sophisticated quad-camera system and AI-powered features. After extensive testing, it's clear this device sets new standards for smartphone cameras.\n\nThe standout feature is the 200MP main camera, which uses pixel binning technology to deliver exceptional detail and low-light performance. The improved night mode produces remarkably clean images even in challenging lighting conditions, rivaling dedicated cameras in many scenarios.\n\nThe 5x periscope telephoto lens has been upgraded with better stabilization and faster autofocus, making it practical for everyday photography rather than just special occasions. Portrait shots benefit from improved edge detection and more natural background blur.\n\nSamsung's AI enhancements go beyond simple scene detection, offering intelligent composition suggestions and real-time optimization of camera settings. The new Galaxy AI features also enable advanced photo editing capabilities directly on the device.\n\nBeyond photography, the S24 Ultra impresses with its 6.8-inch Dynamic AMOLED display, S Pen functionality, and all-day battery life. The build quality feels premium, though the device is noticeably heavy due to its large battery and camera hardware.\n\nWhile the price is substantial at $1,199, the Galaxy S24 Ultra delivers flagship performance across all areas, making it a strong choice for users who prioritize camera quality and productivity features.",
    author: "Maria Gonzalez",
    published_at: 1.week.ago,
    category: "Phones",
    image_url: "https://images.unsplash.com/photo-1592750475338-74b7b21085ab?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
  },
  {
    title: "MacBook Pro M3 Max: Apple Silicon Reaches New Heights",
    summary: "Apple's latest professional laptop delivers unprecedented performance for creative workflows with the new M3 Max chip.",
    content: "Apple's MacBook Pro with M3 Max chip represents a significant leap in portable computing power, particularly for creative professionals and developers who demand top-tier performance. The latest iteration of Apple Silicon continues to impress with its efficiency and raw computational power.\n\nThe M3 Max features up to 40 GPU cores and 128GB of unified memory, making it capable of handling the most demanding video editing, 3D rendering, and machine learning tasks. In our testing, 8K video editing in Final Cut Pro was remarkably smooth, with real-time effects processing that would challenge desktop workstations.\n\nBattery life remains exceptional despite the increased performance, with the 16-inch model delivering up to 18 hours of typical use. This efficiency advantage over Windows laptops with comparable performance continues to be a key differentiator for Apple's professional machines.\n\nThe display quality is outstanding, with the Liquid Retina XDR screen offering true HDR support and exceptional color accuracy for professional work. The speaker system and overall build quality maintain Apple's high standards, though the laptop is noticeably heavier than previous generations.\n\nPort selection has improved with the return of useful connectivity options, though some users may still require dongles for certain workflows. The starting price of $3,199 for the M3 Max configuration places it firmly in the premium professional category.\n\nFor creative professionals working with video, 3D graphics, or complex software development, the MacBook Pro M3 Max offers unmatched performance in a portable form factor.",
    author: "Ryan Foster",
    published_at: 1.week.ago,
    category: "Laptops",
    image_url: "https://images.unsplash.com/photo-1541807084-5c52b6b3adef?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
  },
  {
    title: "Microsoft Copilot Gets Major Update with Enhanced Code Generation",
    summary: "Microsoft's AI assistant receives significant improvements to its programming capabilities, competing directly with GitHub Copilot.",
    content: "Microsoft has released a substantial update to Copilot, its AI-powered assistant, with dramatically improved code generation capabilities that put it in direct competition with specialized programming tools like GitHub Copilot. The update represents Microsoft's continued investment in AI-assisted development.\n\nThe enhanced Copilot can now understand complex programming contexts, generate entire functions from natural language descriptions, and even suggest architectural improvements to existing codebases. Testing shows significant improvements in code quality and relevance compared to previous versions.\n\nNew features include intelligent error detection and correction, automated code documentation, and the ability to explain complex code snippets in plain language. These capabilities make it valuable for both experienced developers and those learning to code.\n\nIntegration across Microsoft's development ecosystem has been deepened, with enhanced functionality in Visual Studio, VS Code, and Azure DevOps. The AI can now participate in code reviews and suggest optimizations based on best practices and performance considerations.\n\nMicrosoft emphasizes that the updated Copilot maintains strong privacy protections, with enterprise customers able to ensure their code never leaves their secure environments. This addresses key concerns organizations have about AI-assisted development tools.\n\nThe update is available to existing Microsoft 365 Copilot subscribers at no additional cost, making it an attractive option for organizations already invested in Microsoft's productivity suite.",
    author: "Jennifer Lee",
    published_at: 2.weeks.ago,
    category: "AI",
    image_url: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
  },
  {
    title: "NVIDIA RTX 5090 Leaked Benchmarks Show 40% Performance Boost",
    summary: "Early benchmarks suggest NVIDIA's next-generation flagship GPU delivers massive performance gains for 4K gaming and AI workloads.",
    content: "Leaked benchmarks for NVIDIA's upcoming RTX 5090 graphics card have surfaced, showing impressive performance improvements over the current RTX 4090. The new flagship GPU appears to deliver up to 40% better performance in 4K gaming scenarios and even larger gains in AI and machine learning workloads.\n\nThe RTX 5090 is built on NVIDIA's next-generation Blackwell architecture, manufactured on TSMC's advanced 4nm process node. This allows for significantly more transistors while maintaining reasonable power consumption levels. Early reports suggest the card will feature 32GB of GDDR7 memory, double that of the RTX 4090.\n\nIn gaming benchmarks, the RTX 5090 consistently delivered frame rates above 60 FPS in demanding titles at 4K resolution with ray tracing enabled. Games like Cyberpunk 2077 with path tracing, which previously struggled on even the RTX 4090, now run smoothly at maximum settings.\n\nThe AI performance improvements are even more dramatic, with the RTX 5090 showing up to 70% faster training times for large language models and image generation tasks. This makes it particularly attractive for content creators and researchers working with AI applications.\n\nNVIDIA is expected to officially announce the RTX 5090 at CES 2025, with availability likely in Q2 2025. Pricing is rumored to start around $1,899, positioning it as a premium offering for enthusiasts and professionals.",
    author: "Tommy Zhang",
    published_at: 4.hours.ago,
    category: "Graphics",
    image_url: "https://images.unsplash.com/photo-1591488320449-011701bb6704?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
  },
  {
    title: "Spotify Introduces AI DJ Feature with Personalized Music Discovery",
    summary: "The music streaming giant's new AI-powered DJ creates custom playlists and provides commentary tailored to individual listening habits.",
    content: "Spotify has launched its most ambitious AI feature yet: an AI DJ that not only curates personalized playlists but also provides spoken commentary about the music, artists, and the user's listening history. The feature represents a significant evolution in how streaming services use artificial intelligence to enhance user experience.\n\nThe AI DJ, simply called 'DJ X', learns from your listening patterns, favorite genres, and even the time of day you prefer certain types of music. It creates seamless transitions between songs while providing insights about artists, album histories, and connections between tracks that users might not have discovered otherwise.\n\nWhat sets DJ X apart from simple playlist generation is its ability to provide context and storytelling. The AI might introduce a song by explaining how it influenced a genre, share interesting facts about the recording process, or highlight connections between artists across different eras.\n\nThe feature uses advanced natural language processing to generate commentary that sounds natural and engaging, avoiding the robotic feel of earlier AI voice systems. Spotify has trained the system on vast amounts of music journalism, artist interviews, and cultural context to ensure the commentary is both accurate and entertaining.\n\nEarly user feedback has been overwhelmingly positive, with many praising the feature's ability to introduce them to new music they might never have discovered through traditional recommendation algorithms. The AI DJ also adapts to feedback, learning which types of commentary and music selections users prefer.\n\nSpotify plans to expand the feature with more personalization options and the ability to request specific moods, decades, or themes for the AI DJ to focus on during listening sessions.",
    author: "Elena Rodriguez",
    published_at: 8.hours.ago,
    category: "AI",
    image_url: "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
  }
]

# Create articles with proper slug generation
articles_data.each do |article_attrs|
  article = Article.find_or_create_by(title: article_attrs[:title]) do |a|
    a.summary = article_attrs[:summary]
    a.content = article_attrs[:content]
    a.author = article_attrs[:author]
    a.published_at = article_attrs[:published_at]
    a.category = article_attrs[:category]
    a.image_url = article_attrs[:image_url]
  end
  
  puts "Created/Found article: #{article.title}"
end

puts "Seeded #{Article.count} articles"
